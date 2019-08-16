package mobile.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.SpecFileRenamePolicy;
import mobile.model.service.MobileService;
import mobile.model.vo.*;

@WebServlet("/insertForm.mo")
public class InsertMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertMobileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod();
		if ( method.equalsIgnoreCase("GET") ) {
			RequestDispatcher view = request.getRequestDispatcher("/views/mobile/insertMobileForm.jsp");
			view.forward(request, response);
		} else {
			String moCode = request.getParameter("moCode");
			String moName = request.getParameter("moName");
			String moNameEn = request.getParameter("moNameEn");
			String brand = request.getParameter("brand");
			int moBrandCode = 0;
			switch ( brand ) {
			case "삼성전자" : moBrandCode = 1; break;
			case "LG전자" : moBrandCode = 2; break;
			case "애플" : moBrandCode = 3; break;
			}
//			Enumeration params = request.getParameterNames();
//			Map<String,	String> specMap = new HashMap<String, String>();
//			while (params.hasMoreElements()){
//			    String key = (String)params.nextElement();
//			    String value = request.getParameter(key);
//			    if ( value != null) specMap.put(key, value);
//			} 
			String releaseDate = request.getParameter("releaseDate");
			String os = request.getParameter("osCode");
			int osCode = 0;
			if ( os != null && !os.equals("") ) osCode = Integer.parseInt(os); 
			String osVersion = request.getParameter("osVersion");
			String material = request.getParameter("material");
			String size = request.getParameter("size");
			String weight = request.getParameter("weight");
			String link = request.getParameter("link");
			String inc = request.getParameter("inch");
			double inch = 0;
			if ( inc != null && !inc.equals("") ) inch = Double.parseDouble(inc);
			String resolution = request.getParameter("resolution");
			String pixelInch = request.getParameter("pixelInch");
			String displayType = request.getParameter("displayType");
			String disWidth = request.getParameter("disWidth");
			String disHeight = request.getParameter("disHeight");
			String ap = request.getParameter("ap");
			String cpu = request.getParameter("cpu");
			String cpuCore = request.getParameter("cpuCore");
			String cpuClock = request.getParameter("cpuClock");
			String gpu = request.getParameter("gpu");
			String ram = request.getParameter("ram");
			String innerMemory = request.getParameter("innerMemory");
			String outerMemory = request.getParameter("outerMemory");
			String cameraSensor = request.getParameter("cameraSensor");
			String iris = request.getParameter("iris");
			String flash = request.getParameter("flash");
			String picResolution = request.getParameter("picResolution");
			String vidResolution = request.getParameter("vidResolution");
			String vidFrame = request.getParameter("vidFrame");
			String frontResolution = request.getParameter("frontResolution");
			String frontVidResolution = request.getParameter("frontVidResolution");
			String frontVidFrame = request.getParameter("frontVidFrame");
			String camera = request.getParameter("camera");
			String bat = request.getParameter("battery");
			int battery = 0;
			if ( bat != null && !bat.equals("") ) battery = Integer.parseInt(bat);
			String batteryType = request.getParameter("batteryType");
			if ( batteryType.equals("-----")) batteryType = null;
			String fastCharging = request.getParameter("fastCharging");
			if ( fastCharging.equals("-----")) fastCharging = null;
			String removableBattery = request.getParameter("removableBattery");
			if ( removableBattery.equals("-----")) removableBattery = null;
			String wirelessCharging = request.getParameter("wirelessCharging");
			if ( wirelessCharging.equals("-----")) wirelessCharging = null;
			String standBy = request.getParameter("standBy");
			String protocol = request.getParameter("protocol");
			String wifi = request.getParameter("wifi");
			String bluetooth = request.getParameter("bluetooth");
			String usb = request.getParameter("usb");
			String bio = request.getParameter("bio");
			String payment = request.getParameter("payment");
			if ( payment.equals("-----")) payment = null;
			String verify = request.getParameter("verify");
			String etc = request.getParameter("etc");
			String status = request.getParameter("status");
			
			MobileInsert1 mi1 = new MobileInsert1(moCode, moName, moNameEn, moBrandCode);
			MobileInsert2 mi2 = new MobileInsert2(releaseDate, osCode, osVersion, material, size, weight, link, inch, resolution, pixelInch, displayType, disWidth, disHeight, ap, cpu, cpuCore, cpuClock, gpu, ram, innerMemory, outerMemory, cameraSensor, iris, flash, picResolution, vidResolution, vidFrame, frontResolution, frontVidResolution, frontVidFrame, camera, battery, batteryType, fastCharging, removableBattery, wirelessCharging, standBy, protocol, wifi, bluetooth, usb, bio, payment, verify, etc);
			
			MobileService moService = new MobileService();
//			int result = moService.insertMobileSummary(mi1);
//			if ( result > 0 ) {
//				result = moService.insertMobile(mi2);
//				if ( result > 0 ) { // 입력 성공
//					//////////// 성공시 이동
//					request.getSession().setAttribute("msg", "device spec이 성공적으로 등록되었습니다.");
//					response.sendRedirect(request.getContextPath()+"/devicelist.mo");
//				}
//			} else {
//				request.setAttribute("msg", "device spec 입력 실패");
//				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if ( ServletFileUpload.isMultipartContent(request) ) {
			
			// 전송 파일 용량 제한 : 10MB
			int maxSiz = 1024*1024*10;
			// 웹 서버 컨테이너 경로 추출
			// --> 프로젝트 경로 추출과장 ( WebContent 까지의 절대경로 )
			String root = request.getSession().getServletContext().getRealPath("/");
			// 파일 저장 경로 지정
			String savePath = root+"image/mobileImages/";
			// 파일명 변환 및 저장 작업
			
			// 5. MultipartRequest 선언
			MultipartRequest multiRequest  = new MultipartRequest(request, savePath, maxSiz, "UTF-8", new SpecFileRenamePolicy());
			// MultipartRequest 객체 생성 시 파일이 저장됨
			
			
			//////////////////// 여기여기
			// 기본 게시판 내용 저장 ///////////////////////////
			
			String moCode = multiRequest.getParameter("moCode");
			String moName = multiRequest.getParameter("moName");
			String moNameEn = multiRequest.getParameter("moNameEn");
			int moBrandCode = Integer.parseInt(multiRequest.getParameter("brand"));
			String releaseDate = multiRequest.getParameter("releaseDate");
			int osCode = Integer.parseInt(multiRequest.getParameter("osCode"));
			String osVersion = multiRequest.getParameter("osVersion");
			String material = multiRequest.getParameter("material");
			String size = multiRequest.getParameter("size");
			String weight = multiRequest.getParameter("weight");
			String link = multiRequest.getParameter("link");
			String inc = multiRequest.getParameter("inch");
			double inch = 0;
			if ( inc != null && !inc.equals("") ) inch = Double.parseDouble(inc);
			String resolution = multiRequest.getParameter("resolution");
			String pixelInch = multiRequest.getParameter("pixelInch");
			String displayType = multiRequest.getParameter("displayType");
			String disWidth = multiRequest.getParameter("disWidth");
			String disHeight = multiRequest.getParameter("disHeight");
			String ap = multiRequest.getParameter("ap");
			String cpu = multiRequest.getParameter("cpu");
			String cpuCore = multiRequest.getParameter("cpuCore");
			String cpuClock = multiRequest.getParameter("cpuClock");
			String gpu = multiRequest.getParameter("gpu");
			String ram = multiRequest.getParameter("ram");
			String innerMemory = multiRequest.getParameter("innerMemory");
			String outerMemory = multiRequest.getParameter("outerMemory");
			String cameraSensor = multiRequest.getParameter("cameraSensor");
			String iris = multiRequest.getParameter("iris");
			String flash = multiRequest.getParameter("flash");
			String picResolution = multiRequest.getParameter("picResolution");
			String vidResolution = multiRequest.getParameter("vidResolution");
			String vidFrame = multiRequest.getParameter("vidFrame");
			String frontResolution = multiRequest.getParameter("frontResolution");
			String frontVidResolution = multiRequest.getParameter("frontVidResolution");
			String frontVidFrame = multiRequest.getParameter("frontVidFrame");
			String camera = multiRequest.getParameter("camera");
			String bat = multiRequest.getParameter("battery");
			int battery = 0;
			if ( bat != null && !bat.equals("") ) battery = Integer.parseInt(bat);
			String batteryType = multiRequest.getParameter("batteryType");
			if ( batteryType.equals("-----")) batteryType = null;
			String fastCharging = multiRequest.getParameter("fastCharging");
			if ( fastCharging.equals("-----")) fastCharging = null;
			String removableBattery = multiRequest.getParameter("removableBattery");
			if ( removableBattery.equals("-----")) removableBattery = null;
			String wirelessCharging = multiRequest.getParameter("wirelessCharging");
			if ( wirelessCharging.equals("-----")) wirelessCharging = null;
			String standBy = multiRequest.getParameter("standBy");
			String protocol = multiRequest.getParameter("protocol");
			String wifi = multiRequest.getParameter("wifi");
			String bluetooth = multiRequest.getParameter("bluetooth");
			String usb = multiRequest.getParameter("usb");
			String bio = multiRequest.getParameter("bio");
			String payment = multiRequest.getParameter("payment");
			if ( payment.equals("-----")) payment = null;
			String verify = multiRequest.getParameter("verify");
			String etc = multiRequest.getParameter("etc");
			String status = multiRequest.getParameter("status");
			
			MobileInsert1 mi1 = new MobileInsert1(moCode, moName, moNameEn, moBrandCode);
			MobileInsert2 mi2 = new MobileInsert2(releaseDate, osCode, osVersion, material, size, weight, link, inch, resolution, pixelInch, displayType, disWidth, disHeight, ap, cpu, cpuCore, cpuClock, gpu, ram, innerMemory, outerMemory, cameraSensor, iris, flash, picResolution, vidResolution, vidFrame, frontResolution, frontVidResolution, frontVidFrame, camera, battery, batteryType, fastCharging, removableBattery, wirelessCharging, standBy, protocol, wifi, bluetooth, usb, bio, payment, verify, etc);
			
			
			
			
			
			/////////////////
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			while ( files.hasMoreElements()) {
				String name = files.nextElement();
				
				// 전송 순서 역순으로 파일 이름을 가져온다.
				
//				System.out.println(name);
				
				if ( multiRequest.getFilesystemName(name) != null ) {
					
					saveFiles.add(multiRequest.getFilesystemName(name));
					
				}
				
			}
				MoImage fileList = new MoImage();
				
				// 전송 순서 역순으로 파일이 list 에 저장 되었기 때문에 반복문을 역으로 수행함
				
//				for ( int i = saveFiles.size() -1; i >= 0 ; i--) {
				MoImage mo = new MoImage();
				// t세터로 저장할 객체 세팅하기
				mo.setMiPath(savePath);
				if ( saveFiles.size() > 1 ) mo.setMiBackImage(saveFiles.get(1));
				if ( saveFiles.size() > 0 ) mo.setMiFrontImage(saveFiles.get(0));
				
				//at.set
					
				// 타이틀 이미지가 origin 랴ㅣㄷㄴd에서의 마지막 인덱스이기 때문에 다음과 같이 조건을 준 다음에
//					
//					 if ( i == saveFiles.size() -1) {
//						 ///레벨 세팅 (섬네일)
//					 } else {
//						 // 레벨 세팅 일반
//					 }
//					 fileList.add(mo);
//				}
				
				MobileService moService = new MobileService();
				int index = moService.getIndex();
				int result = 0, result2 = 0, result3 = 0;
				if ( index > 0 ) {
					result = moService.insertMobileSummary(index, mi1);
					result2 = moService.insertMobile(index, mi2);
					result3 = moService.insertMobileImage(index, mo);
				}
				
				if ( result > 0 && result2 > 0 && result3 > 0 ) {
					request.getSession().setAttribute("msg", "device spec이 성공적으로 등록되었습니다.");
					response.sendRedirect(request.getContextPath()+"/devicelist.mo");
				} else {
					request.setAttribute("msg", "device spec 입력 실패");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
				}
			}
			
			/* for ( int i = 0; i < savaFiles.size(); i++) {
				File faildFile = new File(fileList.get(i).getFilePath() + filList.get(i).getChangeName());
				failedFile.delete();
			} 
			result = 0;
			rollback(conn); <---서비스 단!
			*/
		}
		
}


