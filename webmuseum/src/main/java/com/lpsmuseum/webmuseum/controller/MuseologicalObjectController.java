package com.lpsmuseum.webmuseum.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.service.MuseologicalObjectService;
import com.lpsmuseum.service.builders.MuseologicalObjectBuilder;

@Controller
public class MuseologicalObjectController {
	@RequestMapping("object/create")
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView("object/form");
		return mv;
	}	

	@RequestMapping("object")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("object/list");
		ArrayList<MuseologicalObject> obj = new MuseologicalObjectService().listObjects();
		mv.addObject("list", obj);
		return mv;
	}
	
	@RequestMapping("object/add")
	public ModelAndView addObject(String name, String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		ModelAndView mv;
		try {
			c.setTime(sdf.parse(date));
			MuseologicalObject obj = new MuseologicalObjectBuilder()
			.build(name, c);
			mv = new ModelAndView("redirect:/object");
			mv.addObject("object", obj);
                        mv.addObject("Message", "Cadastrado com sucesso!");
		} catch (ParseException e) {
			e.printStackTrace();
			mv = new ModelAndView("object/error");
		}
		return mv;
	}
	
	@RequestMapping("object/delete")
	public ModelAndView delete(Long id){
		new MuseologicalObjectService().deleteObject(id);
                ModelAndView mv = new ModelAndView("redirect:/object");
                mv.addObject("Message", "Excluído com sucesso!");
                return mv;
	}
}
