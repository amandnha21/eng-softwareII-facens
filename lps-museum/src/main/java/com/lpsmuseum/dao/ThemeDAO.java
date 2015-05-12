/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lpsmuseum.dao;

import com.lpsmuseum.dao.BasicDAO;
import com.lpsmuseum.dao.PersistenceUtil;
import com.lpsmuseum.dto.scenario.Theme;
import com.lpsmuseum.entity.ThemeDO;
import java.util.List;


import javax.persistence.EntityManager;

/**
 *
 * @author Dell
 */
public class ThemeDAO extends BasicDAO {

    @Override
    public Object findEntity(Object obj) {
        ThemeDO ado = (ThemeDO) obj;
		EntityManager em = PersistenceUtil.getEntityManager();
		if(ado.getId() != null){
			Object xdo = em.find(ado.getClass(), ado.getId());
			return xdo;
		} else{
			List<ThemeDO> ados = (List<ThemeDO>)em.createQuery("SELECT a FROM ThemeDO a WHERE a.title = '" + ado.getTitle()  + "'")
				.getResultList();
			ado = ados.isEmpty() ? null : ados.get(0);
		}
		em.close();
		return ado;
    }
    
    public void createTheme(ThemeDO theme){
		create(theme);
	}
    
    
	public List<ThemeDO> listTheme(){
		return list("ThemeDO");
	}
    
    
    
    
    
}
