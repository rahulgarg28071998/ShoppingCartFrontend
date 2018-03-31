package com.rahul.controller;


import java.io.File;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rahul.ShoppingCartBackend.dao.ProductDao;
import com.rahul.ShoppingCartBackend.dto.CartItem;
import com.rahul.ShoppingCartBackend.dto.Product;
import com.rahul.ShoppingCartBackend.dto.User;

@Controller
public class AdminController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	HttpServletRequest request;
	private List<Product> products;
	
	 @RequestMapping(value = "/admin/adminindex", method = RequestMethod.GET)
	  public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) {
		 ModelAndView mav = new ModelAndView("admin/adminindex");
	    mav.addObject("product", new Product());
	    return mav;
	  }
	 
//	 @RequestMapping("admin/adminindex")
//		public @ResponseBody ModelAndView getCartItem(Principal principal) {
//			System.out.println("----------------------");
//		
//			ModelAndView model = new ModelAndView("admin/adminindex");
//			{
//				{
//				products=productDao.productList();	
//				System.out.println(products);
////				model.addObject("titleMsg", "Cart Items");
////				model.addObject("cartitems", cartitems);
//				return model;
//			
//			}
//				
//		}
//		}
	 
	 @RequestMapping(value = "/admin/productData", method = RequestMethod.POST)
	  public ModelAndView addUser(@ModelAttribute("product") Product product, BindingResult result, String action) {
		  //product = (Product)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 Product productResult = new Product();
		 if (result.hasErrors()) {
				ModelAndView model1 = new ModelAndView("admin/adminIndex");
				model1.addObject("title", "Product Management");
				return model1;
			}
		 System.out.println(product.getName() + " " + product.getDescription());
		 System.out.println("/////////////////////////////////////////");
		 switch(action)
		 {
		 case "Add" :System.out.println("+++++++++++++++++");
		 			productDao.add(product);
		 			productResult = product;
		 			break;
		 case "Update":System.out.println("////////////////////////");
		 				productDao.update(product);
		 				productResult = product;
		 				break;
		 case "Delete": System.out.println("-------------------");
		 				productDao.delete(product.getId());
		 				productResult = product;
		 				break;
		 };
				ModelAndView model1 = new ModelAndView("admin/adminresult");
				model1.addObject("title", "Product Management");
				model1.addObject("product", productResult);
				model1.addObject("productList", productDao.productList());
				model1.addObject("success", "Data has been processed");
				return model1;

	  }

	 

	// For Admin
//	@RequestMapping(value = { "/admin/adminindex" })
//	public ModelAndView productcrud() {
//		System.out.println("=========");
//		ModelAndView model = new ModelAndView("admin/adminindex");
//		//model.addObject("title", "Product Management");
//		//model.addObject("userClickProductCRUD", "true"); //redirect product
//		// insert page
//		model.addObject("product", new Product());
//		return model;
//	}




//	public String uploadImage(MultipartFile multipart, Product product) {
//		System.out.println("MultiPart1");
//		String folderToUpload = "/assets/Image/";
//		String fileName = multipart.getOriginalFilename();
//		System.out.println("MultiPart2");
//		String realPath = request.getServletContext().getRealPath(folderToUpload);
//		System.out.println(realPath);
//		if (!new File(realPath).exists()) {
//			System.out.println("MultiPart4");
//			new File(realPath).mkdirs();
//		}
//		System.out.println("MultiPart5");
//		String filePath = realPath + product.getName() + ".jpg";
//		File destination = new File(filePath);
//		try {
//			System.out.println("MultiPart6");
//			multipart.transferTo(destination);
//		} catch (Exception e) {
//
//		}
//		System.out.println(fileName);
//		return fileName;
//	}

	@RequestMapping(value = "/deleteorUpdate/{id}", method = RequestMethod.GET)
	public ModelAndView product11(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("admin/DeleteUpdate");
		mv.addObject("msg", productDao.getProduct(id));

		mv.addObject("title", "Product Management");
		// model.addObject("userClickProductCRUD", "true"); //redirect product
		// insert page
		mv.addObject("product", productDao.getProduct(id));

		return mv;
	}
	
	@RequestMapping(value = "/adminresult")
	public ModelAndView productList() {
		ModelAndView mv = new ModelAndView("adminresult");
		return mv;
	}

	// Send list of Category for select the list
	/*
	 * @ModelAttribute("category") public List<Integer> initializeCategory() {
	 * // List<Category> sections = categoryDao.list(); List<Integer> sections =
	 * new ArrayList<Integer>(); sections.add(1); return sections; }
	 * 
	 * @ModelAttribute("ActiveIs") public List<Boolean> initializeIsActive() {
	 * 
	 * List<Boolean> ActiveIs = new ArrayList<Boolean>();
	 * ActiveIs.add(Boolean.TRUE); ActiveIs.add(Boolean.FALSE); return ActiveIs;
	 * }
	 */

}