package com.neu.sankalp.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="BOOK")
public class Book {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="bookId")
	private int id;
	
	@Column(name="isbn")
	private String isbn;
	
	@Column(name="name")
	private String name;
	
	@Column(name="price")
	private int price;
	
	@Column(name="borrowerid")
	private int borrowerId;
	
	@Column(name="noofdays")
	private int noOfDays;
	 
	@Column(name="IMAGE")
	private byte[] image;

	@Column(name="request")
	private int request;
	
	@ManyToOne
	@JoinColumn(name="id")
    private Person person;
	
	@ManyToOne
	@JoinColumn(name="categoryid")
	private Category category;
	 
	@OneToMany(fetch=FetchType.LAZY, mappedBy="book")
	private Set<BookTransaction> bookTransaction= new HashSet<BookTransaction>();
	
	public String getName() {
		return name; 
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBorrowerId() {
		return borrowerId;
	}
	public void setBorrowerId(int borrowerId) {
		this.borrowerId = borrowerId;
	}
	public int getNoOfDays() {
		return noOfDays;
	}
	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}
	public int getId() {
		return id;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public Set<BookTransaction> getBookTransaction() {
		return bookTransaction;
	}
	public void setBookTransaction(BookTransaction bookTransaction) {
		this.bookTransaction.add(bookTransaction);
	}
	public int getRequest() {
		return request;
	}
	public void setRequest(int request) {
		this.request = request;
	}
	
}
