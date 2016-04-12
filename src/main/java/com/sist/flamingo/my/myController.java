package com.sist.flamingo.my;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller("mc")
public class myController {
	
	@RequestMapping("my.do")
	public String myView(HttpServletRequest req)
	{
		System.out.println("myView");
		return "my/my.jsp";
	}
}