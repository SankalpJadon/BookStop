package com.neu.sankalp.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="BOOKTRANSACTION")
public class BookTransaction {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="transactionid")
	private int transactionId;
	
	@Column(name="borrowerid")
	private int borrowerId;
	
	@Column(name="pointsspent")
	private int pointsSpent;
	
	@ManyToOne
	@JoinColumn(name="id")
	private Book book;
	
	/*@Column(name="isbn")
	private String isbn;*/
	
	public int getBorrowerId() {
		return borrowerId;
	}
	public void setBorrowerId(int borrowerId) {
		this.borrowerId = borrowerId;
	}

	public int getPointsSpent() {
		return pointsSpent;
	}
	public void setPointsSpent(int pointsSpent) {
		this.pointsSpent = pointsSpent;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public int getTransactionId() {
		return transactionId;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	/*public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}*/
	
}
