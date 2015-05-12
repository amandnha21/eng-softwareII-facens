package com.lpsmuseum.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.lpsmuseum.entity.ScenarioDO;

public class ScenarioDAO extends BasicDAO {
	public void createScenario(ScenarioDO scenario){
		create(scenario);
	}
	
	public void editScenario(ScenarioDO scenario){
		merge(scenario);
	}

	@Override
	@SuppressWarnings("unchecked")
	public Object findEntity(Object obj) {
		ScenarioDO sdo = (ScenarioDO) obj;
		EntityManager em = PersistenceUtil.getEntityManager();
		if(sdo.getId() != null){
			sdo =  em.find(sdo.getClass(), sdo.getId());
		} else{
			List<ScenarioDO> sdos = (List<ScenarioDO>)em.createQuery("SELECT s FROM ScenarioDO s WHERE s.name = '" + sdo.getName()  + "'")
				.getResultList();
			sdo = sdos.isEmpty() ? null : sdos.get(0);
		}
		em.close();
		return sdo;
	}
	
	@SuppressWarnings("unchecked")
	public List<ScenarioDO> listScenarios(){
		return list("ScenarioDO");
	}
	
	public void deleteScenario(ScenarioDO scenario){
		delete(scenario);
	}
}
