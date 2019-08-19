package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.Mobile;

@WebServlet("/updateForm.mo")
public class SpecMobileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SpecMobileUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		Mobile mo = new MobileService().selectMobile(mno);
		
		request.getRequestDispatcher("views/mobile/updateMobileForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
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
			int mno = Integer.parseInt(multiRequest.getParameter("mno"));
			String moCode = multiRequest.getParameter("moCode");
			String moName = multiRequest.getParameter("moName");
			String moNameEn = multiRequest.getParameter("moNameEn");
			String tmp = multiRequest.getParameter("brand");
			int moBrandCode = 0;
			if ( tmp != null && !tmp.equals("-----") ) moBrandCode = Integer.parseInt(tmp);
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
			String mFrontImage = multiRequest.getParameter("frontImg");
			String mBackImage = multiRequest.getParameter("backImg");
			
			MobileInsert1 mi1 = new MobileInsert1(moCode, moName, moNameEn, moBrandCode);
			MobileInsert2 mi2 = new MobileInsert2(releaseDate, osCode, osVersion, material, size, weight, link, inch, resolution, pixelInch, displayType, disWidth, disHeight, ap, cpu, cpuCore, cpuClock, gpu, ram, innerMemory, outerMemory, cameraSensor, iris, flash, picResolution, vidResolution, vidFrame, frontResolution, frontVidResolution, frontVidFrame, camera, battery, batteryType, fastCharging, removableBattery, wirelessCharging, standBy, protocol, wifi, bluetooth, usb, bio, payment, verify, etc);
			
			/////////////////
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			while ( files.hasMoreElements()) {
				String name = files.nextElement();
				if ( multiRequest.getFilesystemName(name) != null ) {
					saveFiles.add(multiRequest.getFilesystemName(name));
				}
			}
			MoImage mo = new MoImage();
			mo.setMiPath(savePath);
			if ( saveFiles.size() > 1 ) {
				mo.setMiBackImage(saveFiles.get(1));
			}
			if ( saveFiles.size() > 0 ) {
				mo.setMiFrontImage(saveFiles.get(0));
			}
			if ( !mFrontImage.equals("") && !mFrontImage.contains("#") ) mo.setMiFrontImage(mFrontImage);
			if ( !mBackImage.equals("") && !mBackImage.contains("#") ) mo.setMiBackImage(mBackImage);
			MobileService moService = new MobileService();
			int result = 0, result2 = 0, result3 = 0;
			result = moService.updateMobileSummary(mno, mi1);
			result2 = moService.updateMobile(mno, mi2);
			int check = moService.checkMobileImage(mno);
			if ( check > 0 ) {
				result3 = moService.updateMobileImage(mno, mo);
			} else {
				result3 = moService.insertMobileImage(mno, mo);
			}
				if ( result > 0 && result2 > 0 && result3 > 0 ) {
					request.getSession().setAttribute("msg", "device spec이 성공적으로 갱신되었습니다.");
					response.sendRedirect(request.getContextPath()+"/spec.mo?currentPage=1&mno="+mno+"&page=1");
				} else {
					request.setAttribute("msg", "device spec 입력 실패");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
				}
			}
	}

}
