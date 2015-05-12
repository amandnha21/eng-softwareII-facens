package com.lpsmuseum.service;



import com.lpsmuseum.dao.ThemeDAO;
import com.lpsmuseum.dto.scenario.Theme;
import com.lpsmuseum.entity.ThemeDO;
import java.util.ArrayList;
import java.util.List;

public class ThemeService {
    
    ThemeDAO dao = new ThemeDAO();
    
    public void createTheme(Theme theme) throws Exception{
		ThemeDO themeDO = getEntity(theme);
		dao.createTheme(themeDO);
		theme.setId(themeDO.getId());
	}
    
	public Theme getDto(ThemeDO tdo){
		Theme theme = new Theme();
		theme.setId(tdo.getId());
		theme.setTitle(tdo.getTitle());
		theme.setDescription(tdo.getDescription());
		return theme;
                
               
		
	}
	
	public ThemeDO getEntity(Theme theme){
		ThemeDO tdo = new ThemeDO();
		tdo.setId(theme.getId());
		tdo.setTitle(theme.getTitle());
		tdo.setDescription(theme.getDescription());
		return tdo;
	}

       public ArrayList<Theme> listTheme(){
		List<ThemeDO> mdos = dao.listTheme();
		ArrayList<Theme> mus = new ArrayList<Theme>();
		for(ThemeDO mdo : mdos){
			mus.add(getDto(mdo));
		}
		return mus;
	}
        
       public Theme FindbyID(Long id){
           Theme t = new Theme();
           t.setId(id);
          
           return findTheme(t);
       }
       
       private Theme findTheme(Theme theme){
		ThemeDO mdo = new ThemeDO();
		mdo.setId(theme.getId());
		mdo.setTitle(theme.getTitle());
                mdo.setDescription(theme.getDescription());
		mdo = (ThemeDO)dao.findEntity(mdo);
		return mdo == null ? null : getDto(mdo);
	}
        
}
