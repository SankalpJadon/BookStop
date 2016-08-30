package com.neu.sankalp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neu.sankalp.DAO.AdminDAO;
import com.neu.sankalp.DAO.BookDAO;
import com.neu.sankalp.DAO.UserDAO;
import com.neu.sankalp.exception.AdException;
import com.neu.sankalp.pojo.Book;
import com.neu.sankalp.pojo.Person;

@Controller
public class LoginRegisterController {
	
	@Autowired
	UserDAO userDao;
	@Autowired
	Person person;
	@Autowired
	AdminDAO adminDao;
	@Autowired
	BookDAO bookDao;
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@RequestParam String userName, @RequestParam String password, Model model, HttpSession session,HttpServletRequest request) throws AdException{
		String page="loginpage";
		try{
			person=userDao.getUser(userName.toLowerCase());
			
			if(person!=null){
				if(password.equals(person.getPassword())){
					model.addAttribute("msg",person);
					session.setAttribute("person", person);
					if(person.getRoleid()==1){
						ArrayList<Person> listForApproval= new ArrayList<Person>();
						listForApproval= (ArrayList<Person>) adminDao.getUsersForApproval();
						session.setAttribute("requestList", listForApproval);
						session.setAttribute("list",listForApproval);
						page="adminpage";
					}
					else{
						try{
							int points=userDao.getPoints(person.getUserName());
							List<Book> personBookList= bookDao.getPersonBooks(person);
							List bookList=bookDao.getEntireBookList();
							List borrowedBookList=bookDao.getBorrowedBookList(person.getId());
							List personApprovalBookList= bookDao.getApprovalBookList(person.getId());
							List excludingPersonList= bookDao.getExcludingPersonList(person.getId());
							Book a=(Book) bookList.get(0);
							a.getId();
							session.setAttribute("bookList",bookList);
							session.setAttribute("personBookList", personBookList);
							session.setAttribute("borrowedBookList",borrowedBookList);
							session.setAttribute("personApprovalBookList", personApprovalBookList);
							session.setAttribute("excludingPersonList", excludingPersonList);
							session.setAttribute("points", person.getPoints());
							page= "searchpage";
						}
						catch(AdException e){
							System.out.println("Exception: "+e.getMessage());
						}
					}
				}
				else{
					model.addAttribute("msg","Incorrect Password");
					page="loginpage";
				}
				
			}else{
				model.addAttribute("msg","Member does not exist, Please Register!");
				page="loginpage";
			}	
		}
		catch(AdException e){
			System.out.println("Exception: "+e.getMessage());
		}
		return "redirect:/"+page;
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String createUser(@ModelAttribute("person") Person person,BindingResult result, Model model) throws Exception {
		try {
				if(userDao.getUser(person.getUserName())==null){				
					userDao.createBorrower(person);
					return "loginpage";
				}
				else{
					String msg="User already exists with same username";
					model.addAttribute("msg",msg);
					return "registerpage";
				}				
			} catch (AdException e) {
				System.out.println("Exception: " + e.getMessage());
			}

		return "homepage";
	}	
	
}
