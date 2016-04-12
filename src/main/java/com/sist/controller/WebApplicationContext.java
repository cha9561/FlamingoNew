//webApplicationContext = class관리자 = container
//우리가 만든 class = component
//spring의 핵심 - 경량 컨테이너 
package com.sist.controller;
import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import java.io.*;

public class WebApplicationContext {
//config에서 얻어낸 자바 file을 처리
List<String> list=new ArrayList<String>();
public WebApplicationContext(String path)
{
   try
   {
      SAXParserFactory spf=SAXParserFactory.newInstance();
      SAXParser sp=spf.newSAXParser();
      HandlerMapping hm=new HandlerMapping();
      sp.parse(new File(path), hm);//new File(path)는 dispatcher에서 넘겨줌
      list=hm.list; //list => xml에서 읽은 package가 들어와있다
      
      //1개의 패키지에 여러개의 파일 (안에 for문) , 여러개의 패키지 있을 수 있으므로 for문(밖에)
      /*for(String packName:list)
      {//hm이가지고 있는애는 패키지명 가지고 왔다
         List<String> fList=FileConfig.getFileName(packName);
         for(String fileName:fList)
         {//가져온 모든 java파일을 넣어줬다
            list.add(fileName);//list에 다 추가해준 것을 dispather에 넘긴다.
         }
      }*/
   }catch(Exception ex){}
}
//list 새로 생성 - fileName을 위해서 만든 list(패키지명은 빠진다)
public List<String> getFileName()
{
   List<String> packList=new ArrayList<String>();
   for(String pack:list)//list는 멤버변수로 잡음
   {
      List<String> fList=FileConfig.getFileName(pack); 
      
      for(String s:fList)
      {
         packList.add(s);
      }
   }
   return packList; //이걸 dispatcher로 넘긴다.
}
}