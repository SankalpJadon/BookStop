package com.neu.sankalp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neu.sankalp.DAO.BookDAO;
import com.neu.sankalp.DAO.UserDAO;
import com.neu.sankalp.exception.AdException;
import com.neu.sankalp.pojo.Book;
import com.neu.sankalp.pojo.Category;
import com.neu.sankalp.pojo.Person;

@Controller
public class MemberActionController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private Category category;
	@Autowired
	private Person person;
	@Autowired
	private BookDAO bookDao;

	
	@RequestMapping(value="uploadbooks", method=RequestMethod.POST)
	public String insert(@ModelAttribute("book") Book book, BindingResult bindingResult,@RequestParam String bookcategory,@RequestParam String userName, HttpSession session){
		if(bindingResult.hasErrors()){            
	         return "redirect:/uploadbookspage";        
	     }     	
		String categoryName=bookcategory;
			int categoryId=0;
		if(bookcategory.equals("mystery")){
			categoryId=1;
		}
		else if(bookcategory.equals("fantasy")){
			categoryId=2;
		}
		else if(bookcategory.equals("literaryfiction")){
			categoryId=3;
		}
		else if(bookcategory.equals("children's")){
			categoryId=4;
		}
		else if(bookcategory.equals("thriller")){
			categoryId=5;
		}
		else if(bookcategory.equals("romance")){
			categoryId=6;
		}
		else if(bookcategory.equals("sciencefiction")){
			categoryId=7;
		}
		else if(bookcategory.equals("historical")){
			categoryId=8;
		}
		else if(bookcategory.equals("collegebook")){
			categoryId=9;
		}
			category.setCategoryName(categoryName);
			category.setCategoryId(categoryId);
		try{
			person=userDao.getUser(userName);
			book=userDao.insertBook(book.getName(),book.getIsbn(),book.getNoOfDays(),book.getPrice(),category,person);
			userDao.addPoints(person.getUserName(),person.getPoints());
			int points=userDao.getPoints(person.getUserName());
			System.out.println(book.getName());
			String message="Book named "+book.getName()+" added successfully in the database";
			
			List<Book> personBookList= bookDao.getPersonBooks(person);
			List borrowedBookList=bookDao.getBorrowedBookList(person.getId());
			List bookList=bookDao.getEntireBookList();
			List personApprovalBookList= bookDao.getApprovalBookList(person.getId());
			session.setAttribute("points", points);
			session.setAttribute("bookList",bookList);
			session.setAttribute("personBookList", personBookList);
			session.setAttribute("personApprovalBookList", personApprovalBookList);
			session.setAttribute("borrowedBookList",borrowedBookList);
		}
		catch(AdException e){
			System.out.println("Exception: "+e.getMessage());
		
		}
		return "searchpage";
	}
	
	/*@RequestMapping(value="search", method=RequestMethod.POST)
	public String search(@RequestParam String searchVal, HttpSession session){
		Book book =new Book();
		try{
			UserDAO userDao= new UserDAO();
			book=userDao.getBook(searchVal);
		}
		catch(AdException e){
			System.out.println("Exception: "+e.getMessage());
		
		}
		return "searchpage";
	}*/
	
	@RequestMapping(value="getdeletebooks", method=RequestMethod.GET)
	public String search(HttpSession session) throws AdException{
		person= (Person) session.getAttribute("person");
		try{
		
		List<Book> personBookList= bookDao.getPersonBooks(person);
		List borrowedBookList=bookDao.getBorrowedBookList(person.getId());
		List bookList=bookDao.getEntireBookList();
		List personApprovalBookList= bookDao.getApprovalBookList(person.getId());
		session.setAttribute("bookList",bookList);
		session.setAttribute("personBookList", personBookList);
		session.setAttribute("personApprovalBookList", personApprovalBookList);
		session.setAttribute("borrowedBookList",borrowedBookList);
		}
		catch(AdException e){
			System.out.println("Exception: "+e.getMessage());			
		}

		return "deletebookspage";
	}
	
	@RequestMapping(value = "approverejectrequest/{variable}", method = RequestMethod.GET)
	public void borrowBook(@PathVariable String variable,HttpServletResponse response,HttpSession session) throws IOException{
		person= (Person) session.getAttribute("person");
		int request=0;
		String isbn="";
		if(variable.contains("approve")){
			request=2;
			isbn=variable.replace("approve","");
		}
		else if(variable.contains("reject")){
			request=3;
			isbn=variable.replace("reject", "");
		}
		
		try{
			boolean result=bookDao.approveOrReject(request,isbn);
			
			List<Book> personBookList= bookDao.getPersonBooks(person);
			List borrowedBookList=bookDao.getBorrowedBookList(person.getId());
			List bookList=bookDao.getEntireBookList();
			List personApprovalBookList= bookDao.getApprovalBookList(person.getId());
			session.setAttribute("bookList",bookList);
			session.setAttribute("personBookList", personBookList);
			session.setAttribute("personApprovalBookList", personApprovalBookList);
			session.setAttribute("borrowedBookList",borrowedBookList);
			session.setAttribute("bookList",bookList);
			
			PrintWriter out= response.getWriter();
			out.println(result);
			out.flush();
		}
		catch(AdException e){
			System.out.println("Exception: "+e.getMessage());
		}
	}
}
