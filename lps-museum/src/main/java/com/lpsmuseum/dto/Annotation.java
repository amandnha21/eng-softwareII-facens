package com.lpsmuseum.dto;

public class Annotation {
	private Long id;
	private String author;
	private String title;
	private String content;
	private Long idMuseum;
	private Long idObject;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getIdMuseum() {
		return idMuseum;
	}
	public void setIdMuseum(Long idMuseum) {
		this.idMuseum = idMuseum;
	}
	public Long getIdObject() {
		return idObject;
	}
	public void setIdObject(Long idObject) {
		this.idObject = idObject;
	}
	
}
