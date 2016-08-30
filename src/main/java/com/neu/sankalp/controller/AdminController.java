package com.neu.sankalp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.sankalp.DAO.AdminDAO;
import com.neu.sankalp.exception.AdException;
import com.neu.sankalp.mail.MailMail;

@Controller	
public class AdminController {
	@Autowired
	private AdminDAO adminDao;
	
	@RequestMapping(value="approvePerson/{userName}",method=RequestMethod.GET)
	public @ResponseBody void approveRequest(@PathVariable String userName, HttpServletResponse response) throws AdException, IOException{
		boolean result=adminDao.approvePerson(userName);
		
		PrintWriter out= response.getWriter();
		out.println(result);
		out.flush();
	}
	
	@RequestMapping(value="sendmail",method=RequestMethod.POST)
	public String sendMail(HttpServletRequest request) throws AdException, IOException{
		String recipient= request.getParameter("recipient");
		String subject= request.getParameter("subject");
		String message= request.getParameter("message");

		ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Mail.xml");
	    	 
	    	MailMail mm = (MailMail) context.getBean("mailMail");
	        mm.sendMail("autohealthalert@gmail.com",recipient,subject,message);
	        return "redirect:/emailconfirmation";
	}
}
