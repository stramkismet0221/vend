package com.haiyi.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haiyi.controller.base.BaseController;
import com.haiyi.domain.Menu;
import com.haiyi.listener.InitListener;
import com.haiyi.query.MenuQuery;
import com.haiyi.service.MenuService;
import com.maizi.anno.AuthAnno;
import com.maizi.anno.ControllerAnno;
import com.maizi.exception.KPException;
import com.maizi.utils.JsonModel;

@Controller
@RequestMapping("/menus")
@ControllerAnno(addUI = "/menus/save", detailUI = "/menus/detail", editUI = "/menus/save", listUI = "/menus/list")
public class MenuController extends BaseController<Menu,MenuQuery>{
	
	@Autowired
	HttpServletRequest httpServletRequest;
	
	@Autowired
	public void setMenuService(MenuService menuService) {
		this.baseService = menuService;
	}
	
	@RequestMapping(value={"/{parentId}/menus"},method=RequestMethod.GET)
	@AuthAnno(verifyLogin=true)
	@ResponseBody
	public JsonModel findByParent(@PathVariable Integer parentId){
		
		if(parentId<=0){ 
			parentId = null;   
		}
		List<Menu> mymenus = ((MenuService)this.baseService).findByParent(parentId);
		List<Menu> menus=new ArrayList<>();
		for (Menu menu:mymenus){
			menu.setURL(null);
			menus.add(menu);
		}
		JsonModel jsonModel = new JsonModel();
		jsonModel.setSuccess(true);
		jsonModel.setData(menus);
		return jsonModel;
	}
	
	@Override
	@AuthAnno(verifyLogin=true)
	public String list(HttpServletRequest request, ModelMap modelMap) throws KPException {
		//TODO 需要修复添加/编辑后上一级按钮问题。。。。
		String parentId = request.getParameter("parentId");
		if(!StringUtils.isEmpty(parentId)){
			modelMap.addAttribute("parentId",parentId);
			Menu menu = ((MenuService)this.baseService).findById(parentId);
			if(menu!=null){
				modelMap.addAttribute("preParentId",menu.getParentId());
			}
		}
		return super.list(request, modelMap);
	}
	
	@Override
	@AuthAnno(verifyLogin=true)
	public String add(Menu t, ModelMap modelMap,Errors errors) throws KPException {
		String URL = super.add(t, modelMap, errors);
	    return URL+"?parentId="+t.getParentId();
	}
	
	@Override
	@AuthAnno(verifyLogin=true)
	public String edit(String id, ModelMap modelMap, Menu t) throws KPException {
		String URL = super.edit(id, modelMap, t);
		return URL+"?parentId="+t.getParentId();
	}
	

	@Override
	public Menu beforeSave(ModelMap modelMap, Menu t) throws KPException {
		return t;
	}

	@Override
	public void beforeSaveUI(ModelMap modelMap, String id) throws KPException {
		
		String parentId = httpServletRequest.getParameter("parentId");
		if(!StringUtils.isEmpty(parentId)){
			Menu menu = (Menu) modelMap.get("menu");
			menu.setParentId(Integer.parseInt(parentId));
		} 
	 
		//处理菜单树
		List<Menu> level_menus = (List<Menu>) ContextLoader.getCurrentWebApplicationContext().getServletContext().getAttribute(InitListener.LEVEL_MENUS);
		List<Menu> result = new ArrayList<Menu>();
		generateMenuTree(result,level_menus,"|--");
		modelMap.addAttribute("parentMenus", result);
	}

	@Override
	protected void beforeDelete(String[] ids) throws KPException {
	}
	
	private void generateMenuTree(List<Menu> result,List<Menu> level_menus,String prefix){
		for(Menu temp : level_menus){
			Menu menu = new Menu();
			menu.setId(temp.getId());
			menu.setName(prefix+temp.getName());
			result.add(menu);
			generateMenuTree(result,temp.getChildren(),"　　"+prefix);
		}
	}
}