package com.lpsmuseum.webmuseum.controller;


import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.dto.Museum;
import com.lpsmuseum.dto.Scenario;
import com.lpsmuseum.dto.scenario.Theme;
import com.lpsmuseum.entity.ThemeDO;
import com.lpsmuseum.service.MuseologicalObjectService;
import com.lpsmuseum.service.MuseumService;
import com.lpsmuseum.service.ScenarioService;
import com.lpsmuseum.service.ThemeService;
import com.lpsmuseum.service.builders.ScenarioBuilder;
import java.util.List;
import javax.servlet.http.HttpServletRequest;


@Controller
public class ScenarioController{
    
	@RequestMapping("scenario")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("scenario/list");
		ArrayList<Scenario> sc = new ScenarioService().listScenarios();
		mv.addObject("list", sc);
                ArrayList<Museum> obj = new MuseumService().listMuseum();
		mv.addObject("objects", obj);
                ArrayList<Theme> obj1 = new ThemeService().listTheme();
		mv.addObject("objects1", obj1);
                ArrayList<MuseologicalObject> obj2 = new MuseologicalObjectService().listObjects();
		mv.addObject("objects2", obj2);
                
		return mv;
	}
	
	@RequestMapping("scenario/adiciona")
	public ModelAndView addScenario(Scenario scenario, HttpServletRequest request ) throws Exception {
            ScenarioBuilder s = new ScenarioBuilder();
            
            s.withMuseum(new MuseumService().findById(scenario.getIdMuseum()));
            s.withTheme(new ThemeService().FindbyID(scenario.getIdTheme()));
            

            String[] ids = request.getParameterValues("tests");                
            for (int i = 0; i < ids.length; i++) {
                s.withObject(new MuseologicalObjectService().FindbyID(Long.parseLong(ids[i])));
            }                
            s.build(scenario.getName());         
            

            ModelAndView mv;       
            mv = new ModelAndView("redirect:/scenario");                
            mv.addObject("Message", "Cadastrado com sucesso!");
            return mv;

                
                
	}
         
        
	
	@RequestMapping("scenario/edit")
	public ModelAndView edit(Long id) {
		ModelAndView mv = new ModelAndView("scenario/edit");
		mv.addObject("scenario", new ScenarioService().findById(id));
		return mv;
	}
	
	@RequestMapping("scenario/delete")
	public ModelAndView delete(Long id){
		new ScenarioService().deleteScenario(id);
		ModelAndView mv = new ModelAndView("redirect:/scenario");
                mv.addObject("Message", "Excluído com sucesso!");
                return mv;
	}
        
        @RequestMapping("theme")
	public ModelAndView listTheme() {
		ModelAndView mv = new ModelAndView("scenario/theme");		
		return mv;
	}
        
        @RequestMapping("scenario/theme1")
       public ModelAndView addObject(Theme theme) throws Exception {
           
           new ThemeService().createTheme(theme);           
		ModelAndView mv;       
                mv = new ModelAndView("redirect:/theme");                
                mv.addObject("Message", "Cadastrado com sucesso!");
		return mv;
       }

    
       
        
        
}
