package com.neu.sankalp.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(){
		return "homepage";
	}
	
	@RequestMapping(value = "loginpage", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request){	
		return "loginpage";
	}
	
	@RequestMapping(value = "registerpage", method = RequestMethod.GET)
	public String registerPage(){
		return "registerpage";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "homepage";
	}
	
	@RequestMapping(value="uploadbookspage", method=RequestMethod.GET)
	public String uploadBooksPage(HttpServletRequest request){
		if(request.getSession().getAttribute("person")==null)
        {
            return "redirect:/";
        }
		return "uploadbookspage";
	}
	
	@RequestMapping(value="adminpage", method=RequestMethod.GET)
	public String adminPage(HttpServletRequest request){
		if(request.getSession().getAttribute("person")==null)
        {
            return "redirect:/";
        }
		return "adminpage";
	}
	
	@RequestMapping(value="gethomepage", method=RequestMethod.GET)
	public String homePage(){
		return "homepage";
	}
	
	@RequestMapping(value="homepage", method=RequestMethod.GET)
	public String gethomepage(HttpServletRequest request){
		if(request.getSession().getAttribute("person")==null)
        {
            return "redirect:/";
        }
		return "homepage";
	}
	
	@RequestMapping(value="searchpage", method=RequestMethod.GET)
	public String getsearchpage(HttpServletRequest request){
		if(request.getSession().getAttribute("person")==null)
        {
            return "redirect:/";
        }
		return "homepage";
	}
	
	@RequestMapping(value="emailconfirmation", method=RequestMethod.GET)
	public String getEmailConfirmation(HttpServletRequest request){
		if(request.getSession().getAttribute("person")==null)
        {
            return "redirect:/";
        }
		return "emailconfirmation";
	}
	
	@RequestMapping(value="aboutuspage", method= RequestMethod.GET)
	public String getAboutUsPage(HttpServletRequest request){
		return "aboutuspage";
	}

}