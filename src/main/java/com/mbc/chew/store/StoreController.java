package com.mbc.chew.store;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class StoreController {
	@Autowired
	SqlSession sqls;
	String path="C:\\MBC12AI\\spring\\chewtopia\\src\\main\\webapp\\image";

	
	@RequestMapping(value="/storein")
		public String storein()
	{
			return"storeinput";
	}
	
	@RequestMapping(value="/storesave", method = RequestMethod.POST)
	public String storesave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{
		
		int storecode         = Integer.parseInt(mul.getParameter("storecode"));
		String storename      = mul.getParameter("storename");
		String storeaddress   = mul.getParameter("storeaddress");
		String storecategory  = mul.getParameter("storecategory");
		String storearea	  = mul.getParameter("storearea");
		
		
		List<MultipartFile> files = mul.getFiles("storeimage");
		StoreService ss 	 = sqls.getMapper(StoreService.class);
		StringBuilder fn	  = new StringBuilder();
	
		for (MultipartFile mf : files) {
			if(!mf.isEmpty()) {
			String fname		 = mf.getOriginalFilename();
			UUID uu = UUID.randomUUID();
			fname= uu.toString()+"_"+fname;
			mf.transferTo(new File(path+"\\"+fname));
			fn.append(fname).append(",");
			}
		}
		if (fn.length()>0) {
			fn.setLength(fn.length()-1);
		}
		
		ss.insertstore(storecode,storename,storeaddress,storecategory,storearea,fn.toString());
		return "redirect:/sout";
	}
	
	@RequestMapping(value ="/sout")
	public String storeout(HttpServletRequest request,Model m)
	{
		StoreService ss = sqls.getMapper(StoreService.class);
		ArrayList<StoreDTO>list = ss.outstore();
		m.addAttribute("list",list);
		return "storeout";
	}
	@RequestMapping(value ="/sdelete")
	public String storedelete(HttpServletRequest request,Model m)
	{
		int storecode        = Integer.parseInt(request.getParameter("storecode"));
		StoreService ss  	 = sqls.getMapper(StoreService.class);
		StoreDTO dto 	  	 = ss.storedelete(storecode);
		m.addAttribute("dto",dto);
		return "storedeleteview";
	
	}
	@RequestMapping(value ="/delete",method = RequestMethod.POST)
	public String delete(HttpServletRequest request)
	{
		int storecode   = Integer.parseInt(request.getParameter("storecode"));
		String img 		= request.getParameter("storeimage");
		StoreService ss = sqls.getMapper(StoreService.class);
		ss.delete(storecode);
		File ff 	 	= new File(path+"\\"+img);	
		ff.delete();
		return "redirect:/sout";
	}
	@RequestMapping(value ="/smodify")
	public String ff(HttpServletRequest request,Model m)
	{
		int storecode    = Integer.parseInt(request.getParameter("storecode"));
		StoreService ss  = sqls.getMapper(StoreService.class);
		StoreDTO dto 	 = ss.modify(storecode);
		m.addAttribute("dto",dto);
		return "storemodifyview";
	}
	
	
	@RequestMapping(value="modify")
	public String gg(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{
		int storecode   	 = Integer.parseInt(mul.getParameter("storecode"));
		String storename     = mul.getParameter("storename");
		String storeaddress  = mul.getParameter("storeaddress");
		String storecategory = mul.getParameter("storecategory");
		String storearea	 = mul.getParameter("storearea");
		MultipartFile mf 	 = mul.getFile("storeimage");
		StoreService ss 	 = sqls.getMapper(StoreService.class);
		if(mf.isEmpty()) { 
			ss.updatemodi1(storecode,storename,storeaddress,storecategory,storearea);
		}
		else {
			String fname = mf.getOriginalFilename();
			UUID uu 	 = UUID.randomUUID();
			fname		 = uu.toString()+"_"+fname;
	
			mf.transferTo(new File(path+"\\"+fname));
			ss.insertstore(storecode,storename,storeaddress,storecategory,storearea,fname);
		}
		return "redirect:/sout";
	}
	
	@RequestMapping(value="storemanage_detail")
	public String hh(HttpServletRequest request,Model m) {
		int num=Integer.parseInt(request.getParameter("num"));
		StoreService ss = sqls.getMapper(StoreService.class);
		StoreDTO dto= ss.selectOne(num);
		m.addAttribute("dto", dto);
		return "storemanage_detail";
	}
}