package com.neu.sankalp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.neu.sankalp.DAO.BookDAO;
import com.neu.sankalp.DAO.UserDAO;
import com.neu.sankalp.exception.AdException;
import com.neu.sankalp.pojo.Book;
import com.neu.sankalp.pojo.BookTransaction;
import com.neu.sankalp.pojo.Person;
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;

@Controller
public class SearchPageController {

	@Autowired
	private BookDAO bookDao;
	@Autowired
	private Person person;
	@Autowired
	private BookTransaction transaction;
	@Autowired
	private Book book;
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(value = "fetchbooks/{category}", method = RequestMethod.GET)
	public String fetchBooks(@PathVariable String category, HttpSession session){
		session.setAttribute("msg", category);
		System.out.println(category);
		return "searchpage";
	}
	
	@RequestMapping(value = "getsearchpage", method = RequestMethod.GET)
	public ModelAndView searchPage(HttpSession session){
		ModelAndView mv = new ModelAndView();
		try{
			List bookList=bookDao.getEntireBookList();
			if(session!=null){
				List<Book> personBookList= bookDao.getPersonBooks(person);
				List borrowedBookList=bookDao.getBorrowedBookList(person.getId());
				List personApprovalBookList= bookDao.getApprovalBookList(person.getId());
				session.setAttribute("bookList",bookList);
				session.setAttribute("personBookList", personBookList);
				session.setAttribute("personApprovalBookList", personApprovalBookList);
				session.setAttribute("borrowedBookList",borrowedBookList);

			}
			mv.addObject(bookList);
			mv.setViewName("searchpage");
		}
		catch(AdException e){
			System.out.println("Exception: "+e.getMessage());
		}
		return mv;
	}
	
	@RequestMapping(value = "borrowbook/{isbn}", method = RequestMethod.GET)
	public ModelAndView borrowBook(@PathVariable String isbn,HttpServletResponse response,HttpSession session) throws IOException,TwilioRestException{
		person= (Person) session.getAttribute("person");
		int pId= person.getId();
		int points= person.getPoints();
		ModelAndView mv = new ModelAndView();
		try{
			boolean result=bookDao.borrow(isbn,pId,points,transaction);
			if(result){
				
				try{
					 String ACCOUNT_SID= "AC10cd3c45fe4b9b2648c5cd66d3b72cba";
				     String AUTH_TOKEN= "ade2fa31636eaaea3f1b3a77222cb904";
					 TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
					 List<NameValuePair> params = new ArrayList<NameValuePair>();
					 params.add(new BasicNameValuePair("To", "+18572944202")); 
					 params.add(new BasicNameValuePair("From", "+17816133835")); 
					 params.add(new BasicNameValuePair("Body", "Hi! Someone Requested a book that you uploaded on BookStop. Please log in to approve!"));   
				 
					 MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
					 Message message = messageFactory.create(params); 
					 System.out.println(message.getSid()); 
				        
				   }catch(TwilioRestException  e){
						e.printStackTrace();
					}
				
			}
			List<Book> personBookList= bookDao.getPersonBooks(person);
			List borrowedBookList=bookDao.getBorrowedBookList(person.getId());
			List bookList=bookDao.getEntireBookList();
			List personApprovalBookList= bookDao.getApprovalBookList(person.getId());
			session.setAttribute("bookList",bookList);
			session.setAttribute("personBookList", personBookList);
			session.setAttribute("personApprovalBookList", personApprovalBookList);
			session.setAttribute("borrowedBookList",borrowedBookList);			
			PrintWriter out= response.getWriter();
			out.println(result);
			out.flush();
			mv.setViewName("homepage");
		}
		catch(AdException e){
			System.out.println("Exception: "+e.getMessage());
		}
		return mv;
	}
}
