package com.neu.sankalp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.sankalp.DAO.AdminDAO;
import com.neu.sankalp.DAO.BookDAO;
import com.neu.sankalp.exception.AdException;
import com.neu.sankalp.pojo.Book;
import com.neu.sankalp.pojo.Person;

@Controller
public class DashboardController {
	@Autowired
	private BookDAO bookDao;
	@Autowired
	private Person person;
	
	@RequestMapping(value="requestDeclined/{isbn}",method=RequestMethod.GET)
	public @ResponseBody void requestDeclined(@PathVariable String isbn, HttpServletResponse response, HttpSession session) throws AdException, IOException{
		boolean result= bookDao.declinedRequest(isbn);
		person=(Person) session.getAttribute("person");
		List personBookList= bookDao.getPersonBooks(person);
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
	}
	
	@RequestMapping(value="updatebook",method=RequestMethod.POST)
	public String update(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws AdException, IOException, NumberFormatException{
		String isbn= request.getParameter("isbn");
		String name=request.getParameter("name");
		boolean result=false;
		try{
			int priceupdated= Integer.parseInt(request.getParameter("price"));
			int updatednoofdays= Integer.parseInt(request.getParameter("noOfDays"));
			result= bookDao.updateBook(isbn,name,updatednoofdays,priceupdated);
		} catch(NumberFormatException e){
			result=false;
		}
		person=(Person) session.getAttribute("person");
		List personBookList= bookDao.getPersonBooks(person);
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
		
		return "deletebookspage";
	}
	
	@RequestMapping(value="deletebook",method=RequestMethod.POST)
	public String deleteBook(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws AdException, IOException{
		String isbn= request.getParameter("isbn");
		boolean result1= bookDao.deleteTransaction(isbn);
		boolean result=false;
		if(result1){
			result= bookDao.deleteBook(isbn);	
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
		
		return "deletebookspage";
	}
}
