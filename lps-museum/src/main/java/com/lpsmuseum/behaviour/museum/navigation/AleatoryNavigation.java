package com.lpsmuseum.behaviour.museum.navigation;

import java.util.List;

import com.lpsmuseum.behaviour.museum.Navigation;
import com.lpsmuseum.dto.Scenario;
import java.util.ArrayList;
import java.util.Random;

public class AleatoryNavigation implements Navigation {

    public Node getNavigation(List<Scenario> scenarios) {
        //TODO: Grafo, sqn
        List<Scenario> aleatorio = new ArrayList<Scenario>();
        Random r = new Random();
        int size = scenarios.size();
        int aux = 0;
        while (aleatorio.size() != size) {
            aux = r.nextInt(size);
            if (!aleatorio.contains(scenarios.get(aux)))
                aleatorio.add(scenarios.get(aux));
        }
        
        return scenariosFila(new Node(), aleatorio, 1);
    }

    public Node scenariosFila(Node fila, List<Scenario> scenarios, int index) {
        if (index > scenarios.size()) return fila;
        
        fila.setScenario(scenarios.get(index));
        
        return scenariosFila(fila.getNeighbors().get(0), scenarios, index+1);
    }
}
