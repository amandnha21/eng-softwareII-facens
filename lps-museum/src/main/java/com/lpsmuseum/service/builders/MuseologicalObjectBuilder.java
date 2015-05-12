package com.lpsmuseum.service.builders;

import java.util.ArrayList;
import java.util.Calendar;

import com.lpsmuseum.dto.Annotation;
import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.service.AnnotationService;
import com.lpsmuseum.service.MuseologicalObjectService;

public class MuseologicalObjectBuilder {
	ArrayList<Annotation> annotations = new ArrayList<Annotation>();
	
        public MuseologicalObject build(String name, Calendar date){
		return build(name, date, new MuseologicalObject());
	}
	
	public MuseologicalObject build(String name, Calendar date, MuseologicalObject instance){
		MuseologicalObject obj = instance.createObject(name, date);
		MuseologicalObjectService svc = new MuseologicalObjectService();
               
		svc.createObject(obj);
		AnnotationService as = new AnnotationService();
		for(Annotation a : annotations){
			a.setIdObject(obj.getId());
			as.createAnnotation(a);
		}
		return obj;
	}
	
	
	public MuseologicalObjectBuilder withAnnotation(Annotation annotation){
		annotations.add(annotation);
		return this;
	}
}
