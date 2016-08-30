 package com.neu.sankalp.DAO;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.neu.sankalp.exception.AdException;
import com.neu.sankalp.pojo.Book;
import com.neu.sankalp.pojo.BookTransaction;
import com.neu.sankalp.pojo.Category;
import com.neu.sankalp.pojo.Person;

public class BookDAO extends DAO {

    public BookDAO() {
    }
    
    public List<Book> getEntireBookList() throws AdException {
        try {
            begin();
            Criteria crit=getSession().createCriteria(Book.class);
            crit.add(Restrictions.eq("request",0));
            List<Book> list= crit.list();
            System.out.println(list);
            commit();
            return list;
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Exception while retrieving Books: " + e.getMessage());
        }
    }
    public List<Book> getPersonBooks(Person person) throws AdException {
        try {
            begin();
            String hql="from Book where person.id=:personId";
            Query q=getSession().createQuery(hql);
            q.setParameter("personId", person.getId());
            List<Book> bookList= q.list();
            System.out.println("hi");
            commit();
            return bookList;
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Exception while retrieving Books: " + e.getMessage());
        }
    }
    
    public boolean borrow(String isbn,int personId, int points,BookTransaction transaction) throws AdException {
    	boolean result=false;
        try {
            begin();
            Query query1=getSession().createQuery("from Book where isbn= :isbn");
            query1.setString("isbn",isbn);
            Book book=(Book)query1.uniqueResult();
            if(points<book.getPrice()){
            	return result;
            }
            else{
            	 transaction.setBook(book);
                 transaction.setBorrowerId(personId);
                 transaction.setPointsSpent(book.getPrice());
                 book.setBookTransaction(transaction);
                 getSession().save(transaction);
                 String hql="update Book set borrowerId=:borrowerId, request=:request where isbn=:isbn";
                 Query query2=getSession().createQuery(hql);
                 query2.setParameter("borrowerId", personId);
                 query2.setParameter("request", 1);
                 query2.setParameter("isbn", isbn);
                 query2.executeUpdate();
                 commit();
                 result=true;            
            }           
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Exception while retrieving Books: " + e.getMessage());
        }
        return result;
    }
    
    public List<Book> getBorrowedBookList(int personId) throws AdException {
    	boolean result=false;
        try {
            begin();
            Criteria crit= getSession().createCriteria(Book.class);
            crit.add(Restrictions.eq("borrowerId", personId));
            crit.add(Restrictions.ne("request", 0));
            List<Book> borrowedBookList= crit.list();
            commit();
            return borrowedBookList;
   
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Exception while retrieving Books: " + e.getMessage());
        }
    }
    

    public List<Book> getApprovalBookList(int personId) throws AdException {
    	boolean result=false;
        try {
            begin();
            Criteria crit= getSession().createCriteria(Book.class);
            crit.add(Restrictions.eq("person.id", personId));
            crit.add(Restrictions.eq("request", 1));
            List<Book> borrowedBookList= crit.list();
            commit();
            return borrowedBookList;
   
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Exception while retrieving Books: " + e.getMessage());
        }
    }
    
    public boolean approveOrReject(int request, String isbn) throws AdException {
    	boolean result=false;
        try {
            begin();
            String hql;
            if(request==2){
                
                 Query q3= getSession().createQuery("select borrowerId from Book where isbn=:isbn");
                 q3.setParameter("isbn", isbn);
                 int borrowerId=(Integer)q3.uniqueResult();
                 Query q4= getSession().createQuery("from Person where id=:id");
                 q4.setParameter("id", borrowerId);
                 Person person=(Person)q4.uniqueResult();
                 Query q1= getSession().createQuery(" from Book where isbn=:isbn");
                 q1.setParameter("isbn", isbn);
                 Book book=(Book) q1.uniqueResult();
                 Query q2= getSession().createQuery("update Person set points=:points where id=:id");
                 q2.setParameter("points", person.getPoints()-book.getPrice());
                 q2.setParameter("id", person.getId());
                 q2.executeUpdate();
                 hql="update Book set request=:request where isbn=:isbn";
            }
            else{
                 hql="update Book set request=:request where isbn=:isbn";
            }
            Query q=getSession().createQuery(hql);
            q.setParameter("request", request);
            q.setParameter("isbn", isbn);
            q.executeUpdate();
            commit();
            result=true;
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Exception while approving Books: " + e.getMessage());
        }
        return result;
    }
    
    
    public boolean declinedRequest(String isbn) throws AdException {
    	boolean result=false;
        try {
            begin();
            String hql="update Book set request=:request, borrowerId=:borrowerId where isbn=:isbn";
            Query q=getSession().createQuery(hql);
            q.setParameter("request", 0);
            q.setParameter("borrowerId", 0);
            q.setParameter("isbn", isbn);
            q.executeUpdate();
            commit();
            result=true;
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Exception while approving Books: " + e.getMessage());
        }
        return result;
    }
    
    public boolean updateBook(String isbn,String name,int noOfDays,int price) throws AdException{
    	try{
    		begin();
            String hql="update Book set name=:name, noOfDays=:noOfDays,price=:price where isbn=:isbn";
            Query q=getSession().createQuery(hql);
            q.setParameter("isbn", isbn);
            q.setParameter("name", name);
            q.setParameter("noOfDays", noOfDays);
            q.setParameter("price", price);
            q.executeUpdate();
            commit();
            return true;
    	} catch (HibernateException e){
    		rollback();
    		throw new AdException("Book named"+" "+name+" "+"could not be updated"+" "+ e.getMessage());
    	}
    }
    
    public boolean deleteBook(String isbn) throws AdException{
    	try{
    		begin();
            String hql="delete from Book where isbn=:isbn";
            Query q=getSession().createQuery(hql);
            q.setParameter("isbn", isbn);
            q.executeUpdate();
            commit();
            return true;
    	} catch (HibernateException e){
    		rollback();
    		throw new AdException("Book with isbn"+isbn+"could not be deleted"+" "+ e.getMessage());
    	}
    }
    
    public boolean deleteTransaction(String isbn) throws AdException{
    	try{
    		begin();
            String hql="delete from BookTransaction where isbn=:isbn";
            Query q=getSession().createQuery(hql);
            q.setParameter("isbn", isbn);
            q.executeUpdate();
            commit();
            return true;
    	} catch (HibernateException e){
    		rollback();
    		throw new AdException("Transaction with isbn"+isbn+"could not be deleted"+" "+ e.getMessage());
    	}
    }
    
    public List<Book> getExcludingPersonList(int personId) throws AdException {
    	boolean result=false;
        try {
            begin();
            Criteria crit= getSession().createCriteria(Book.class);
            crit.add(Restrictions.ne("person.id", personId));
            crit.add(Restrictions.eq("request", 0));
            List<Book> excludingPersonList= crit.list();
            commit();
            return excludingPersonList;
   
        } catch (HibernateException e) {
            rollback();
            throw new AdException("Exception while retrieving Books: " + e.getMessage());
        }
    }
}
