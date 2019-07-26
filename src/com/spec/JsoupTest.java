package com.spec;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupTest {
	public static void main(String[] args) {
		 // Jsoup를 이용해서 http://www.cgv.co.kr/movies/ 크롤링
		 String url = "https://review.cetizen.com/7149/view/3/7149/review"; //크롤링할 url지정

		 Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
		 
		 try {

	            doc = Jsoup.connect(url).get();

	        } catch (IOException e) {

	            e.printStackTrace();

	        }
		 
		 Elements element = doc.select("span.clr100.b");
		 Elements element2 = doc.select("span.p14.clr100.ls-0.ln20"); 
		 System.out.println("============================================================");
		 
		 System.out.println(element.html());
		 System.out.println(element2.html());
		 
		 System.out.println("============================================================");

		 System.out.println(element.text());
		 System.out.println(element2.text());
	        

	        //Iterator을 사용하여 하나씩 값 가져오기

	        Iterator<Element> ie1 = element.iterator();

	        Iterator<Element> ie2 = element2.iterator();

	        while (ie1.hasNext()) {

	            System.out.println(ie1.next().text());

	        }
	        
	        while (ie2.hasNext()) {
	        	
	        	System.out.println(ie2.next().text());
	        	
	        }

	        

	        System.out.println("============================================================");
		 
		 
	}
}
