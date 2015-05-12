package com.lpsmuseum.dto.scenario;

import java.util.List;

import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.dto.Scenario;

public class ScenarioChallenge extends Scenario {
	private List<Challenge> challenges;
	
	public ScenarioChallenge(String name, List<Challenge> challenges, List<MuseologicalObject> objects){
		super(name, objects);
		this.challenges = challenges;
	}

	public List<Challenge> getChallenges() {
		return challenges;
	}

	public void setChallenges(List<Challenge> challenges) {
		this.challenges = challenges;
	}
}
