package com.neu.sankalp.pojo;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PERSON")
public class Person {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
	@Column(name="email")
	private String email;
	
	@Column(name="userName")
	private String userName;
	
	@Column(name="firstname")
	private String firstName;
	
	@Column(name="lastname")
	private String lastName;
	
	@Column(name="age")
	private int age;
	
	@Column(name="points")
	private int points;
	
	@Column(name="password")
	private String password;
	
	@Column(name="ssn")
	private String SSN;
	
	@Column(name="street")
	private String street;
	
	@Column(name="zip")
	private int zip;
	
	@Column(name="roleid")
	private int roleid;
	
	@Column(name="request")
	private Boolean request;
	
	@OneToMany(mappedBy="person")
    private Set<Book> book= new HashSet<Book>();
	
	@OneToMany(mappedBy="person")
	private Set<Communication> communication= new HashSet<Communication>();
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getId(){
		return id;
	}
	public String getSSN() {
		return SSN;
	}
	public void setSSN(String SSN) {
		this.SSN = SSN;
	}
	public Set<Book> getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book.add(book);
	}
	public Set<Communication> getCommunication() {
		return communication;
	}
	public void setCommunication(Set<Communication> communication) {
		this.communication = communication;
	}
	public boolean getRequest() {
		return request;
	}
	public void setRequest(Boolean request) {
		this.request = request;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}	
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public void setBook(Set<Book> book) {
		this.book = book;
	}

}
