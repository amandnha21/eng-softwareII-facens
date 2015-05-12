package com.lpsmuseum.behaviour.museum.navigation;

import java.util.ArrayList;
import java.util.List;

import com.lpsmuseum.dto.Scenario;

public class Node {
	private Scenario scenario;
	private List<Node> neighbors = new ArrayList<Node>();
	
	public Scenario getScenario() {
		return scenario;
	}
	public void setScenario(Scenario scenario) {
		this.scenario = scenario;
	}
	public List<Node> getNeighbors() {
		return neighbors;
	}

}
