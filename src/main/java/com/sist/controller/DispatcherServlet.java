package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class DispatcherServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
   private WebApplicationContext wc;
   private List<String> list=new ArrayList<String>();
   
   public void init(ServletConfig config) throws ServletException {
	   
      String path=config.getInitParameter("contextConfigLocation");
      System.out.println(path);
      //webApplicationContext <==> Handlermapping (Class)
      wc=new WebApplicationContext(path);
      //list=wc.list;//wc가 보낸 list dispatcher에서 받았다. <=패키지명이 모인 잘못된 list
      list=wc.getFileName();
      
   }

   
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try
      {
         String cmd=request.getRequestURI();
         cmd=cmd.substring(request.getContextPath().length()+1);//list.do
         for(String strCls:list)
         {//Web으로부터 받은 모든 file을 가지고 있다 이제 메모리 할당 할 차례
            Class clsName=Class.forName(strCls);//이렇게 하기 위해서 자바파일을 다 모은것이다.
            
            //controller가 올라간 class만 메모리 할당을 해야하므로 if로 구별
            if(clsName.isAnnotationPresent(Controller.class)==false)
               continue;
               //어노테이션이 없으면 메모리할당이 안된다. (이거 빠뜨리면 NullPointException)**
            Object obj=clsName.newInstance(); //어노테이션이 있는지 없는지 확인 하고 있으면 메모리 할당해라
            //실질적 메모리 할당은 newInstance() 를 줘야 한다.
            
            //메모리 할당 되었으니 메소드 찾아와서 호출해라
            Method[] methods=clsName.getDeclaredMethods();
            for(Method m:methods)
            {
               //requestMapping을 가져와서 cmd(아까 잘른것 ex- list.do)가 같은지 확인해야한다
               RequestMapping rm=m.getAnnotation(RequestMapping.class);
               //리퀘스트마다 가지고 있는 어노테이션을 가져와라 
               //rm은 controller에 있는 등록해둔 list.do / content.do를 가지고 있다.
               if(rm.value().equals(cmd))
               {
                  String jsp=(String)m.invoke(obj, request);
                  //response까지 넘겨주고 싶으면 ,찍고 넘기면 됨[가변, 따라서 ,로 여러개를 넘길 수 있음]
                  RequestDispatcher rd=request.getRequestDispatcher(jsp);
                  rd.forward(request, response);
                  return; //포워드 시키고 끝내야 한다 -> return으로 메소드 종료
               }
            }
         }
      }catch(Exception ex){}
   }

}