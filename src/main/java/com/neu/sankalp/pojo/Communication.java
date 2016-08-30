package com.neu.sankalp.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Communication {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="communicationId")
	private int communicationId;
	
	@Column(name="sender")
	private String sender;
	
	@Column(name="subject")
	private String subject;
	
	@Column(name="message")
	private String message;
	
	@ManyToOne
	@JoinColumn(name="id")
	private Person person;
	
	
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getCommunicationId() {
		return communicationId;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
		
}
