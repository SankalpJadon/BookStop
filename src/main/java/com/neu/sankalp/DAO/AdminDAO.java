package com.neu.sankalp.DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.neu.sankalp.exception.AdException;
import com.neu.sankalp.pojo.Person;

public class AdminDAO extends DAO{

	 public AdminDAO() {
	    }
	    public List<Person> getUsersForApproval() throws AdException {
	        try {
	            begin();
	            Criteria crit=getSession().createCriteria(Person.class);
	            crit.add(Restrictions.eq("request",false));
	            List<Person> list= crit.list();
	            System.out.println(list);
	            commit();
	            return list;
	        } catch (HibernateException e) {
	            rollback();
	            //throw new AdException("Could not create person " + username, e);
	            throw new AdException("Exception while creating person: " + e.getMessage());
	        }
	    }
	    
		public boolean approvePerson(String userName) throws AdException {
			try{
				begin();
				Query q=getSession().createQuery("update Person set request=:request where userName=:userName");
				q.setString("userName",userName);
				q.setBoolean("request", true);
				q.executeUpdate();
	            commit();
	            return true;
			}
			catch(HibernateException e){
				rollback();
				throw new AdException("Exception while approving person:"+e.getMessage());
			}
					
		}
}
