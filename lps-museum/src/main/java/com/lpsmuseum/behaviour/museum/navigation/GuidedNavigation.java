package com.lpsmuseum.behaviour.museum.navigation;

import java.util.List;

import com.lpsmuseum.behaviour.museum.Navigation;
import com.lpsmuseum.dto.Scenario;

public class GuidedNavigation implements Navigation {

    public Node getNavigation(List<Scenario> scenarios) {
        //TODO: Lista (Fila) de cenários ordenados, retornar o primeiro.
        Node n = new Node();
        Node a = new Node();
        
        for (Scenario s : scenarios) {
            a.setScenario(s);
            n.getNeighbors().add(a);
        }
        
        return n;
    }

    public Node scenariosFila(Node fila, List<Scenario> scenarios, int index) {
        if (index > scenarios.size()) return fila;
        
        fila.setScenario(scenarios.get(index));
        
        return scenariosFila(fila.getNeighbors().get(0), scenarios, index+1);
    }
}
