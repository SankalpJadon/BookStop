package com.neu.sankalp.DAO;


import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.neu.sankalp.exception.AdException;
import com.neu.sankalp.pojo.Book;
import com.neu.sankalp.pojo.Category;
import com.neu.sankalp.pojo.Person;

public class UserDAO extends DAO {

    public UserDAO() {
    }
    public Person createBorrower(Person person)
            throws AdException {
        try {
            begin();
            System.out.println("inside DAO");
            person.setRequest(false);
            person.setPoints(200);
            person.setRoleid(2); 
            getSession().save(person);
            commit();
            return person;
        } catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create person " + username, e);
            throw new AdException("Exception while creating person: " + e.getMessage());
        }
    }
    
    public Person getUser(String userName) throws AdException {
        try {
            begin();
            Query q=getSession().createQuery("from Person where userName= :userName");
            q.setString("userName",userName);
            Person person=(Person)q.uniqueResult();
            commit();
            return person;
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Could not obtain the named Person " + userName + " " + e.getMessage());
        }
    }
    
    public Book insertBook(String bookName,String isbn,int noOfDays,int price,Category category,Person person) throws AdException{
    	try{
    		begin();
    		Book book= new Book();
    		book.setCategory(category);
    		getSession().save(category);
    		book.setName(bookName);
    		book.setIsbn(isbn);
    		book.setNoOfDays(noOfDays);
    		book.setPrice(price);
    		book.setRequest(0);
    		person.setBook(book);
    		getSession().save(person);
    		book.setPerson(person);
    		getSession().save(book);
    		commit();
    		return book;
    	} catch (HibernateException e){
    		rollback();
    		throw new AdException("Book named"+" "+bookName+" "+"could not be added"+" "+ e.getMessage());
    	}
    }
    
    public int getPoints(String userName) throws AdException {
        try {
            begin();
            Query q=getSession().createQuery("select points from Person where userName= :userName");
            q.setString("userName",userName);
            Integer points=(Integer) q.uniqueResult();
            commit();
            return points;
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Could not obtain pointes of named Person " + userName + " " + e.getMessage());
        }
    }
    
    public void addPoints(String userName, int points) throws AdException {
        try {
            begin();
            Query q=getSession().createQuery("update Person set points=:points where userName= :userName");
            q.setInteger("points",points+20);
            q.setString("userName", userName);
            q.executeUpdate();
            commit();
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Could not add points for named Person " + userName + " " + e.getMessage());
        }
    }
    
    /*public Book getBook(String bookName) throws AdException{
    	try{
    		 begin();
             System.out.println("inside DAO: Insert books");
             Book book= new Book();
             Role role= new Role();
             role.setRoleId(2);
             role.setRoleName("member");
             getSession().save(role);           
             person.setUserName(userName);
             person.setEmail(email);
             person.setFirstName(firstName);
             person.setLastName(lastName);
             person.setDateOfBirth(dateOfBirth);
             person.setPassword(password);
             person.setRole(role); 
             getSession().save(person);
             commit();
             return person;
    	} catch (HibernateException e){
    		rollback();
    		throw new AdException("Book named"+" "+bookName+" "+"could not be found"+" "+ e.getMessage());
    	}
    }*/
}