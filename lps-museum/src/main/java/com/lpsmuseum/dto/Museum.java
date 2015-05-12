package com.lpsmuseum.dto;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.lpsmuseum.behaviour.museum.Navigation;
import com.lpsmuseum.behaviour.museum.navigation.Node;
import java.util.ArrayList;
import org.hibernate.mapping.Collection;

public class Museum {
	private Long id;
	private String name;
	private List<Scenario> scenarios;
	private Navigation navigation;
	
	public Museum(){
	}
	
	public Museum(String name, List<Scenario> scenarios) {
		this.name = name;
		this.scenarios = scenarios;
	}
	
	public Museum sortScenarios() {
		Collections.sort(scenarios, new Comparator<Scenario>() {
	        public int compare(Scenario  scenario1, Scenario  scenario2)
	        {
	        	return  scenario1.getHistoricalTime().compareTo(scenario2.getHistoricalTime());
	        }
	    });
		return this;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Navigation getNavigation() {
		return navigation;
	}
	
	public Museum setNavigation(Navigation navigation){
            this.navigation = navigation;
            /*Node n = this.navigation.getNavigation(this.scenarios);
            List<Scenario> listNavigation = new ArrayList<Scenario>();
            
            do {
                listNavigation.add(n.getScenario());
                if (n.getNeighbors().size() > 0)
                    n = n.getNeighbors().get(0);
            } while (n.getNeighbors().size() > 0);

            this.scenarios = listNavigation;
            */
            
            return this;
	}
	
	public List<Scenario> getScenarios() {
		return scenarios;
	}
}
