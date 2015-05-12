package com.lpsmuseum.webmuseum.controller;

import com.lpsmuseum.behaviour.museum.navigation.AleatoryNavigation;
import com.lpsmuseum.behaviour.museum.navigation.GuidedNavigation;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lpsmuseum.dto.Museum;
import com.lpsmuseum.service.MuseumService;
import com.lpsmuseum.service.builders.MuseumBuilder;
import java.text.ParseException;

@Controller
public class MuseumController {
    
	@RequestMapping("museum")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("museum/list");
		ArrayList<Museum> mus = new MuseumService().listMuseum();
		mv.addObject("list", mus);
		return mv;
	}
        
        @RequestMapping("present")
	public ModelAndView listPresent() {
		ModelAndView mv = new ModelAndView("museum/Present");
		
		return mv;
	}
	
	@RequestMapping("museum/edit")
	public ModelAndView edit(Long id, String name) throws Exception {
            ModelAndView mv;
            try {	
                Museum obj = new MuseumService().findById(id);
                obj.setName(name);
                new MuseumService().editMuseum(obj);	
                mv = new ModelAndView("redirect:/museum");
                mv.addObject("Message", "Editado com sucesso!");
            } catch (ParseException e) {
                e.printStackTrace();
                mv = new ModelAndView("object/error");
            }
            return mv;
	}
        
	@RequestMapping("museum/delete")
	public String delete(Long id){
		new MuseumService().deleteMuseum(id);
		return "redirect:/museum";
	}
        
        @RequestMapping("museum/add")
	public ModelAndView addObject(String name) throws Exception {
		
		ModelAndView mv;
		try {			
			Museum obj = new MuseumBuilder().build(name);			
			mv = new ModelAndView("redirect:/museum");
			mv.addObject("object", obj);
                        mv.addObject("Message", "Cadastrado com sucesso!");
		} catch (ParseException e){
			e.printStackTrace();
			mv = new ModelAndView("object/error");
		}
		return mv;
	}
        
        @RequestMapping("navigation")
	public ModelAndView navigation(Long id) throws Exception {
			
            Museum obj = new MuseumService().findById(id);
            //obj.setNavigation(new GuidedNavigation());
            ModelAndView mv = new ModelAndView("museum/navigation");
            mv.addObject("museum", obj);

            return mv;
	}
        
        @RequestMapping("navigation-aleatory")
	public ModelAndView navigationAleatorory(Long id) throws Exception {
			
            Museum obj = new MuseumService().findById(id);
            //obj.setNavigation(new AleatoryNavigation());
            ModelAndView mv = new ModelAndView("museum/navigation");
            mv.addObject("museum", obj);

            return mv;
	}
        
}
