package com.neu.sankalp.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class BookImage {
	@Id	
	@Column(name="ID")
	private Integer imageId;
	@Column(name="IMAGE")
	private byte[] image;
	@Column(name="IMAGE_NAME")
	private String imgName;
	@ManyToOne
	@JoinColumn(name="id")
	private Book book;
	
	public Integer getImageId() {
		return imageId;
	}
	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
		
}
