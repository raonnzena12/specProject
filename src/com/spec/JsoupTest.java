package com.spec;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import mobile.model.service.MobileService;
import mobile.model.vo.MobileInsert1;
import mobile.model.vo.MobileInsert2;

public class JsoupTest {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		while(true) {
			
		System.out.print("주소 입력 : ");
//		 String url = "https://review.cetizen.com/6704/view/3/6704/review"; //크롤링할 url지정
		String url = scan.nextLine();
		 Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
		 try {
	            doc = Jsoup.connect(url).get();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		 
		 Elements element = doc.select("span.clr100.b");
		 Elements element2 = doc.select("span.p14.clr100.ls-0.ln20"); 
		 Elements element3 = doc.select("span.b");
		 Elements element4 = doc.select("li[style=\"margin-top:5px;clear:both;float:left;width:40%;padding:3px 0px 2px 0px;\"]");
		 System.out.println("============================================================");
		 
//		 System.out.println(element.text());
//		 System.out.println(element2.text());
//		 System.out.println(element3.html());
	        
		 List<Element> eList = new ArrayList<Element>(element);
		 List<Element> eList2 = new ArrayList<Element>(element2);
		 List<Element> eList3 = new ArrayList<Element>(element3);
		 
		 System.out.println(eList.toString());
		 System.out.println(eList2.toString());
//		 System.out.println(eList3.toString());
		 
		 // MobileInsert1 객체 생성
		 String moName = eList.get(3).text().trim();
		 String moNameEn = eList.get(4).text().trim();
		 String moCode = eList3.get(18).text().trim();
		 String brand = eList2.get(0).text().trim();
		 int brandCode = 0;
		 switch ( brand ) {
		 case "삼성전자" : brandCode = 1; break;
		 case "LG전자" : brandCode = 2; break;
		 case "애플" : brandCode = 3; break;
		 case "팬택" : brandCode = 4; break;
		 case "HTC" : brandCode = 5; break;
		 case "모토로라" : brandCode = 6; break;
		 case "KT Tech" : brandCode = 7; break;
		 case "SK 텔레시스" : brandCode = 8; break;
		 case "소니 모바일" : brandCode = 9; break;
		 case "노키아" : brandCode = 10; break;
		 }
		 MobileInsert1 mi1 = new MobileInsert1(moCode, moName, moNameEn, brandCode);
		 
		 
		 // MobileInser2 객체 생성
		 // String date형으로 변환
		 String releaseDate = element4.text().trim().substring(6);
		 if (releaseDate.length()==7) releaseDate = releaseDate + "/01";
		 
		 // os 정보 받아오기
		 String osInfo = eList2.get(3).text().trim();
		 String[] os = osInfo.split(" ",2);
		 int osCode = 0;
		 switch (os[0]) {
		 case "안드로이드" : osCode = 1; break;
		 case "Android" : osCode = 1; break;
		 case "iOS" : osCode = 2; break;
		 case "MIUI" : osCode = 1; 
		 }
		 String osVersion = "";
		 if ( os.length != 1 && !os[0].equals("MIUI") ) {
			 osVersion = os[1].trim();
		 } else if( os[0].equals("MIUI")) {
			 osVersion = osInfo;
		 }
		 String material = eList2.get(4).text().trim().equals("")? null : eList2.get(4).text().trim();
		 String size = eList2.get(5).text().trim();
		 String weight = eList2.get(6).text().trim();
		 String link = eList2.get(7).text().trim();
		 double inch;
		 try {
			 inch = Double.parseDouble(eList2.get(8).text().trim());
		 } catch ( Exception e ) {
			 e.printStackTrace();
			 inch = 0;
		 }
		 String resolution = eList2.get(9).text().trim();
		 String pixelInch = eList2.get(10).text().trim();
		 String displayType = eList2.get(11).text().trim();
		 String disWidth = eList2.get(12).text().trim();
		 String disHeight = eList2.get(13).text().trim();
		 String ap = eList2.get(14).text().trim();
		 String cpu = eList2.get(15).text().trim();
		 String cpuCore = eList2.get(16).text().trim();
		 String cpuClock = eList2.get(17).text().trim();
		 String gpu = eList2.get(18).text().trim();
		 String ram = eList2.get(19).text().trim();
		 String innerMemory = eList2.get(20).text().trim();
		 String outerMemory = eList2.get(21).text().trim();
		 String cameraSensor = eList2.get(22).text().trim().equals("-")? null : eList2.get(22).text().trim();
		 String iris = eList2.get(23).text().trim();
		 String flash = eList2.get(24).text().trim().equals("")? null : eList2.get(24).text().trim();
		 String picResolution = eList2.get(25).text().trim();
		 String vidResolution = eList2.get(26).text().trim();
		 String vidFrame = eList2.get(27).text().trim();
		 String frontResolution = eList2.get(28).text().trim();
		 String frontVidResolution = eList2.get(29).text().trim();
		 String frontVidFrame = eList2.get(30).text().trim();
		 String camera = eList2.get(31).text().trim().equals("")? null : eList2.get(31).text().trim();
		 // 배터리 저장하기
		 String[] batArr = eList2.get(32).text().trim().split(" ");
		 int battery = 0;
		 if ( batArr.length != 1 ) battery = Integer.parseInt(batArr[0]);
		 String batteryType = eList2.get(33).text().trim();
		 // 배터리 급속충전/탈착여부 저장 ㅠㅠㅠ
		 String[] batArr2 = eList2.get(34).text().trim().split(" ");
		 String fastCharging = null;
		 String removableBattery = null;
		 for ( String str : batArr2 ) {
			 if ( str.equals("급속충전") ) fastCharging = str;
			 else removableBattery = str;
		 }
		 String wirelessCharging = eList2.get(35).text().trim().equals("-")? null : eList2.get(35).text().trim();
		 String standBy = eList2.get(36).text().trim().equals("-")? null : eList2.get(36).text().trim();
		 String protocol = eList2.get(37).text().trim();
		 String wifi = eList2.get(38).text().trim();
		 String bluetooth = eList2.get(39).text().trim();
		 String usb = eList2.get(40).text().trim();
		 String bio = eList2.get(41).text().trim();
		 String payment = eList2.get(42).text().trim();
		 String verify = eList2.get(43).text().trim().equals("")? null : eList2.get(43).text().trim();
		 String etc = eList2.get(44).text().trim().equals("")? null : eList2.get(44).text().trim();

		 MobileInsert2 mi2 = new MobileInsert2(releaseDate, osCode, osVersion, material, size, weight, link, inch, resolution, pixelInch, displayType, disWidth, disHeight, ap, cpu, cpuCore, cpuClock, gpu, ram, innerMemory, outerMemory, cameraSensor, iris, flash, picResolution, vidResolution, vidFrame, frontResolution, frontVidResolution, frontVidFrame, camera, battery, batteryType, fastCharging, removableBattery, wirelessCharging, standBy, protocol, wifi, bluetooth, usb, bio, payment, verify, etc);
		 
		 MobileService moService = new MobileService();
		 int index = moService.getIndex();
		 int result = moService.insertMobileSummary(index, mi1);
		 if ( result > 0 ) result = moService.insertMobile(index, mi2);
		 if ( result > 0 ) System.out.println(moName + " DB 입력 성공");
		 
	        //Iterator을 사용하여 하나씩 값 가져오기

//	        Iterator<Element> ie1 = element.iterator();
//
//	        Iterator<Element> ie2 = element2.iterator();
//
//	        while (ie1.hasNext()) {
//
//	            System.out.println(ie1.next().text());
//
//	        }
//	        System.out.println();
//	        while (ie2.hasNext()) {
//	        	
//	        	System.out.println(ie2.next().text());
//	        	
//	        }

	        

	        System.out.println("============================================================");
		 
		}
	}
}
