package com.rahul.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rahul.ShoppingCartBackend.dao.*;
import com.rahul.ShoppingCartBackend.dto.*;

@Controller
public class UserController {

	
	@Autowired
	private ProductDao ProductDaoImpl;
	String username="Aa";
	@Autowired
	private UserDao userDao;
	@Autowired
	private CartItemDao CartItemDaoImpl;
	private static User user;
	private static CartItem cartItem;
	private static Cart cart;
	private static Product product;
	boolean status;

	private List<CartItem> cartitems;

	// For User
			@RequestMapping(value = "/user/userindex")
			public ModelAndView userIndex() {
				
				ModelAndView mv = new ModelAndView("user/userindex");
				
				return mv;
			}
			@RequestMapping(value = "/user/About")
			public ModelAndView userAbout() {
				
				ModelAndView mv = new ModelAndView("user/About");
				
				return mv;
			}		
			
//	// It's for providing User id to web flow in checkout
//	@RequestMapping("/checkoutData")
//	public String getCheckout(Principal principal) {
//		user = userDao.getUserByUsername(username);
//
//		return "redirect:/checkout?user_id=" + user.getUser_id();
//	}

//	// For User Cart
//	@RequestMapping(value = "/user/cart")
//	public ModelAndView userCart() {
//		
//		ModelAndView mv = new ModelAndView("user/cart");
//		return mv;
//	}

			// For User Cart
			@RequestMapping(value = "/user/congo")
			public ModelAndView userCart() {
				
				ModelAndView mv = new ModelAndView("user/congo");
				return mv;
			}
	// For for return list of cartItem from DataTable in cart.jsp
	@RequestMapping("user/cart")
	public @ResponseBody ModelAndView getCartItem(Principal principal) {
		System.out.println("----------------------");
	
		ModelAndView model = new ModelAndView("user/cart");
		{
			{user = userDao.getUserByUsername(username);
			cart = user.getCart();
			cartitems = cart.getCartList();
			model.addObject("titleMsg", "Cart Items");
			model.addObject("cartitems", cartitems);
			return model;
		
		}
			
	}
	}

	// For User add to cart result message
	@RequestMapping(value = "/user/result")
	public ModelAndView result() {
		ModelAndView mv = new ModelAndView("user/result");
		return mv;
	}
//	@RequestMapping(value = "/user/userViewProduct")
//	public ModelAndView viewproduct() {
//		ModelAndView mv = new ModelAndView("user/userViewProduct");
//		return mv;
//	}

	// To view single product in a page
	@RequestMapping(value = "user/userViewProduct/{id}")
	public ModelAndView product11(@PathVariable("id") int id,Principal principal) {
		ModelAndView mv = new ModelAndView("user/userViewProduct");
		
		System.out.println("---------------------");
		product=ProductDaoImpl.getProduct(id);
		System.out.println("htt");
		System.out.println(product.getName());
		mv.addObject("msg", ProductDaoImpl.getProduct(id));
		return mv;
	}

	// To increase product quantity by + link
	@RequestMapping(value = "user/plusOneProductQuantity/{id}")
	public ModelAndView plusOneProductQuantity(@PathVariable("id") int id, Principal principal) {
		System.out.println("===================");
		{
			user = userDao.getUserByUsername(username);
			cart = user.getCart();
			product = ProductDaoImpl.getProduct(id);
			cartItem = CartItemDaoImpl.getCartItemByUserIdAndProductId(cart, product);
			cart = cartItem.getCart();
			product = cartItem.getProduct();
			int oldQuantity = cartItem.getSell_quantity();
			cartItem.setSell_quantity(cartItem.getSell_quantity() + 1);
			cartItem.setTotal_price(product.getPrice() * cartItem.getSell_quantity());
			cart.setGrandTotal(cart.getGrandTotal() + (cartItem.getSell_quantity() - oldQuantity) * product.getPrice());
			status = CartItemDaoImpl.updateCartItem(cartItem);
			// mv.addObject("status", status);
			return new ModelAndView("redirect:/user/cart");
		}

		// mv.addObject("msg", ProductDaoImpl.getProduct(id));
		//return new ModelAndView("redirect:/cart/cartItem/data");
	}

	// To decrease product quantity by - link
	@RequestMapping(value = "user/minusOneProductQuantity/{id}")
	public ModelAndView minusOneProductQuantity(@PathVariable("id") int id, Principal principal) {
	 {
			user = userDao.getUserByUsername(username);
			cart = user.getCart();
			product = ProductDaoImpl.getProduct(id);
			cartItem = CartItemDaoImpl.getCartItemByUserIdAndProductId(cart, product);
			cart = cartItem.getCart();
			product = cartItem.getProduct();
			int oldQuantity = cartItem.getSell_quantity();
			if (oldQuantity > 1) {
				cartItem.setSell_quantity(cartItem.getSell_quantity() - 1);
				cartItem.setTotal_price(product.getPrice() * cartItem.getSell_quantity());
				cart.setGrandTotal(
						cart.getGrandTotal() - (oldQuantity - cartItem.getSell_quantity()) * product.getPrice());
				status = CartItemDaoImpl.updateCartItem(cartItem);
			} else {
				return new ModelAndView("redirect:/user/cart");
			}
			// mv.addObject("status", status);
			return new ModelAndView("redirect:/user/cart");
		}

		// mv.addObject("msg", ProductDaoImpl.getProduct(id));
		//return new ModelAndView("redirect:/cart/cartItem/data");
	}

	// Add new product in cart item and also update in cart
	@RequestMapping(value = "user/addProductToCartItem/{id}")
	public ModelAndView addProductToCartItem(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("/user/result");	

		int id1=59;
		  		String msg = null;
		product = ProductDaoImpl.getProduct(id1);
			{System.out.println("++++++++++++++++++");
			user = userDao.getUserByUsername(username);
			cart = user.getCart();
			if ((cart.getCartItemCount() == 0) || (CartItemDaoImpl.searchCartItemByUserIdAndProductId(cart, product))) {
				System.out.println("//////////////////");
				cartItem = new CartItem();
				product.setActiveIs(true);
				cartItem.setCart(user.getCart());
				cartItem.setProduct(product);
				cartItem.setSell_quantity(1);// compare with product available
												// quantity remaining and
												// display
												// err
				
				cartItem.setTotal_price(product.getPrice() * cartItem.getSell_quantity());
				cart.setGrandTotal(cart.getGrandTotal() + cartItem.getTotal_price());
				cart.setCartItemCount(cart.getCartItemCount() + 1);
				status = CartItemDaoImpl.addCartItem(cartItem);

			} else if (cart.getCartItemCount() != 0) {
				System.out.println("-----------");
				cartItem = CartItemDaoImpl.getCartItemByUserIdAndProductId(cart, product);
				cart = cartItem.getCart();
				product = cartItem.getProduct();
				int oldQuantity = cartItem.getSell_quantity();
				cartItem.setSell_quantity(cartItem.getSell_quantity() + 1);
				cartItem.setTotal_price(product.getPrice() * cartItem.getSell_quantity());
				cart.setGrandTotal(
						cart.getGrandTotal() + (cartItem.getSell_quantity() - oldQuantity) * product.getPrice());
				status = CartItemDaoImpl.updateCartItem(cartItem);

			}
			// This message will display in result.jsp page
			if (status) {
				msg = "Added to Cart";
			} else {
				msg = "Already in Cart";
			}
		}
		System.out.println(msg);
		mv.addObject("msg", msg);
		return mv;
	}

}

