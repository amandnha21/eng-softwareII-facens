package com.lpsmuseum.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import com.lpsmuseum.dto.MuseologicalObject;

@Entity
@Table(name = "museological_object")
@SuppressWarnings("serial")
public class MuseologicalObjectDO implements Serializable {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_object")
	private Long id;
	@NotNull
	@Column(name="name")
	private String name;
	@Column(name="object_type")
	private Boolean objectType;
	@Temporal(TemporalType.DATE)
	@Column(name="date")
	private Date date;
	
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public Boolean getObjectType() { return objectType; }
	public void setObjectType(Boolean objectType) { this.objectType = objectType; }
	
	public Date getDate() { return date; }
	public void setDate(Date date) { this.date = date; }
	public MuseologicalObject getDto() {
		MuseologicalObject obj = new MuseologicalObject();
		obj.setId(getId());
		obj.setName(getName());
		obj.setObjectType(getObjectType());
		//obj.setIndexation(getIndexation());
		return obj;
	}
        
        
}
