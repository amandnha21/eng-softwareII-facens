package com.lpsmuseum.service;

import java.util.ArrayList;
import java.util.List;

import com.lpsmuseum.dao.MuseologicalObjectDAO;
import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.dto.Museum;
import com.lpsmuseum.entity.MuseologicalObjectDO;

public class MuseologicalObjectService {
	MuseologicalObjectDAO dao = new MuseologicalObjectDAO();
	
	public void createObject(MuseologicalObject object){
		MuseologicalObjectDO objDO = object.getEntity();
               
		dao.createObject(objDO);
		object.setId(objDO.getId());
	}
	
	public void editObject(MuseologicalObject object){
		MuseologicalObjectDO objDO = object.getEntity();
		dao.editObject(objDO);
	}
	
	public MuseologicalObject findObject(MuseologicalObject object){
		MuseologicalObjectDO mdo = findEntity(object);
		return mdo.getDto();
	}

	public MuseologicalObjectDO findEntity(MuseologicalObject object) {
		MuseologicalObjectDO objDO = new MuseologicalObjectDO();
		objDO.setId(object.getId());
		objDO.setName(object.getName());
		return (MuseologicalObjectDO)dao.findEntity(objDO);
	}
	
	public ArrayList<MuseologicalObject> listObjects(){
		List<MuseologicalObjectDO> odos = dao.listObjects();
		ArrayList<MuseologicalObject> objects = new ArrayList<MuseologicalObject>();
		for(MuseologicalObjectDO odo : odos){
			MuseologicalObject o = odo.getDto();
			objects.add(o);
		}
		return objects;
	}
	
	public void deleteObject(Long id){
		MuseologicalObjectDO obj = new MuseologicalObjectDO();
		obj.setId(id);
		dao.deleteObject(obj);
	}
        
        public MuseologicalObject FindbyID(Long id){
           MuseologicalObject t = new MuseologicalObject();
           t.setId(id);
           
           return findMuseologicalObject(t);
       }
        
        private MuseologicalObject findMuseologicalObject(MuseologicalObject museologicalObject){
		MuseologicalObjectDO mdo = new MuseologicalObjectDO();
		mdo.setName(museologicalObject.getName());
                mdo.setId(museologicalObject.getId());
                
             
		mdo = (MuseologicalObjectDO)dao.findEntity(mdo);
		return mdo == null ? null : getDto(mdo);
	}
        
        public MuseologicalObject getDto(MuseologicalObjectDO tdo){
		MuseologicalObject museologicalObject = new MuseologicalObject();
                museologicalObject.setId(tdo.getId());
                 museologicalObject.setName(tdo.getName());
		
		return museologicalObject;
                
               
		
	}
        
        
}
