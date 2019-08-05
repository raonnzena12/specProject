package mobile.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

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
			request.setCharacterEncoding("UTF-8");
			String moCode = request.getParameter("moCode");
			String moName = request.getParameter("moName");
			String moNameEn = request.getParameter("moNameEn");
			String brand = request.getParameter("brand");
			int moBrandCode = 4;
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
			String date = request.getParameter("releaseDate");
			Date releaseDate;
			try {
				releaseDate = Date.valueOf(date);
			} catch ( Exception e ) {
				e.printStackTrace();
				releaseDate = null;
			}
			String os = request.getParameter("osCode");
			int osCode = 0;
			if ( os != null ) osCode = Integer.parseInt(os); 
			String osVersion = request.getParameter("osVersion");
			String material = request.getParameter("material");
			String size = request.getParameter("size");
			String weight = request.getParameter("weight");
			String link = request.getParameter("link");
			String inc = request.getParameter("inch");
			double inch = 0;
			if ( inc != null ) inch = Double.parseDouble(inc);
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
			if ( bat != null ) battery = Integer.parseInt(bat);
			String batteryType = request.getParameter("batteryType");
			String fastCharging = request.getParameter("fastCharging");
			String removableBattery = request.getParameter("removableBattery");
			String wirelessCharging = request.getParameter("wirelessCharging");
			String standBy = request.getParameter("standBy");
			String protocol = request.getParameter("protocol");
			String wifi = request.getParameter("wifi");
			String bluetooth = request.getParameter("bluetooth");
			String usb = request.getParameter("usb");
			String bio = request.getParameter("bio");
			String payment = request.getParameter("payment");
			String verify = request.getParameter("verify");
			String etc = request.getParameter("etc");
			String status = request.getParameter("status");
			
			MobileInsert1 mi1 = new MobileInsert1(moCode, moName, moNameEn, moBrandCode);
			MobileInsert2 mi2 = new MobileInsert2(releaseDate, osCode, osVersion, material, size, weight, link, inch, resolution, pixelInch, displayType, disWidth, disHeight, ap, cpu, cpuCore, cpuClock, gpu, ram, innerMemory, outerMemory, cameraSensor, iris, flash, picResolution, vidResolution, vidFrame, frontResolution, frontVidResolution, frontVidFrame, camera, battery, batteryType, fastCharging, removableBattery, wirelessCharging, standBy, protocol, wifi, bluetooth, usb, bio, payment, verify, etc);
			
			MobileService moService = new MobileService();
			int result = moService.insertMobileSummary(mi1);
			if ( result > 0 ) {
				result = moService.insertMobile(mi2);
				if ( result > 0 ) { // 입력 성공
					//////////// 성공시 이동
					request.getSession().setAttribute("msg", "device spec이 성공적으로 등록되었습니다.");
					response.sendRedirect(request.getContextPath()+"/devicelist.mo");
				}
			} else {
				request.setAttribute("msg", "device spec 입력 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
