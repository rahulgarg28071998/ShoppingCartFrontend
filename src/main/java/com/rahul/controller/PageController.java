package com.rahul.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rahul.ShoppingCartBackend.dao.ProductDao;
import com.rahul.ShoppingCartBackend.dao.UserDao;
import com.rahul.ShoppingCartBackend.dto.Product;
import com.rahul.ShoppingCartBackend.dto.User;

@Controller
public class PageController {

	@Autowired
	private ProductDao ProductDaoImpl;
	@Autowired
	UserDao userDao;

	@RequestMapping(value = { "/", "/index" })
	public String index(Principal principal, Model model) {

		if (principal != null) {
			User user = userDao.getUserByUsername(principal.getName());
			if (user.getRole().equalsIgnoreCase("ADMIN")) {
				return "redirect:/admin/adminIndex";
			} else if (user.getRole().equalsIgnoreCase("CUSTOMER")) {
				return "redirect:/user/userindex";
			}
		}
		return "index";
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	  public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("login");
	   // User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      
	    mav.addObject("user", new User());
	    return mav;
		
	  }
	  @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	  public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user") User user,Principal principal) {
	    ModelAndView mav = null;
	    
	    User user1 = userDao.getUserByUsername(user.getName());
	    if (null != user1) {
	    	if (user1.getRole().equalsIgnoreCase("admin")) {
	    		
	    			mav = new ModelAndView("admin/adminindex");
	    			}
	    		 else if (user1.getRole().equalsIgnoreCase("user")) 
	    		 {
	    		    	mav = new ModelAndView("user/userindex");
	    		}
	    
	   mav.addObject("name", user.getName());  
	    } 
	    else {
	    mav = new ModelAndView("login");
	    mav.addObject("message", "Username or Password is wrong!!");
	    } //mav = new ModelAndView("user/userindex");
		   
	    return mav;
	  }
	  @RequestMapping(value = "/Register", method = RequestMethod.GET)
	  public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("Register");
	    mav.addObject("user", new User());
	    return mav;
	  }
	  @RequestMapping(value = "/RegisterProcess", method = RequestMethod.POST)
	  public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user") User user) {
	 
	 userDao.add(user);
	 ModelAndView mav = new ModelAndView("RegResultPage");System.out.println("registed");
	  return mav;
	  }


//@RequestMapping(value="/Register",method=RequestMethod.POST)
//public String SaveForm(ModelMap model,@ModelAttribute("user")@Valid User user ,BindingResult br,HttpSession session)
//{
//	if(br.hasErrors()) {System.out.println("error");
//		return "Register";
//	}
//	else 
//		userDao.add(user);
//		
//	return "redirect/RegResultPage";
//}

	 
	@GetMapping("/About")
	public String aboutus(Model model) {
		
		return "About";
	}
	
	@GetMapping("/product1")
	public String product1(Model model) {
		
		return "product1";
	}
	// For display result page after register user
		@RequestMapping(value = "/RegResultPage")
		public ModelAndView RegResultPage() {
			ModelAndView mv = new ModelAndView("result");
			return mv;
		}

		

		// For List of Products in productList.jsp
		@RequestMapping(value = "/productList")
		public ModelAndView productList() {
			ModelAndView mv = new ModelAndView("productList");
			return mv;
		}
		@RequestMapping(value = "/cart")
		public ModelAndView cart() {
			ModelAndView mv = new ModelAndView("cart");
			return mv;
		}

		// For for return list of product in DataTable in productList.jsp
		@RequestMapping("/product1/all/data")
		public @ResponseBody List<Product> getProducts() {
			return ProductDaoImpl.productList();
		}
		

		// For single product in product1.jsp
		@RequestMapping(value = "/product11/{id}")
		public ModelAndView product11(@PathVariable("id") int id) {
			ModelAndView mv = new ModelAndView("product1");
			mv.addObject("msg", ProductDaoImpl.getProduct(id));
			return mv;
		}

}