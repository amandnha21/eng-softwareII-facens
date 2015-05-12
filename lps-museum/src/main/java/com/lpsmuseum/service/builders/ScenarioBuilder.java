package com.lpsmuseum.service.builders;

import java.util.ArrayList;
import java.util.List;

import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.dto.Museum;
import com.lpsmuseum.dto.Scenario;
import com.lpsmuseum.dto.scenario.Challenge;
import com.lpsmuseum.dto.scenario.ScenarioChallenge;
import com.lpsmuseum.dto.scenario.Theme;
import com.lpsmuseum.service.ScenarioService;

public class ScenarioBuilder {
	private List<MuseologicalObject> objects = new ArrayList<MuseologicalObject>();
	private List<Challenge> challenges = new ArrayList<Challenge>();
	private Theme theme = null;
        private Museum museum = null;
	
	public Scenario build(String name) throws Exception
	{
		Scenario s;
		if(challenges.size() > 0)
			s = new ScenarioChallenge(name, challenges, objects);
		else s = new Scenario(name, objects);
		if(theme == null) throw new Exception("Theme must not be null!");
		s.setIdTheme(theme.getId());
                s.setIdMuseum(museum.getId());
		ScenarioService svc = new ScenarioService();
		svc.createScenario(s);
		return s;
	}
	
	public ScenarioBuilder withObject(MuseologicalObject obj)
	{
		objects.add(obj);
		return this;
	}
	
	public ScenarioBuilder withChallenge(Challenge challenge)
	{
		challenges.add(challenge);
		return this;
	}
	
	public ScenarioBuilder withTheme(Theme theme)
	{
		this.theme = theme;
		return this;
	}
        
        public ScenarioBuilder withMuseum(Museum museum)
	{
		this.museum = museum;
		return this;
	}
}
