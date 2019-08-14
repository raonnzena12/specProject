package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class SpecFileRenamePolicy implements FileRenamePolicy {
	
	public SpecFileRenamePolicy() {}
	
	@Override
	public File rename(File originFile) {
		// 현재시간 + 랜덤 5자리를 이용하여 파일명 변경
		long currentTime = System.currentTimeMillis();
		Date date = new Date(currentTime);
		SimpleDateFormat ft = new SimpleDateFormat("yyMMddHHmmss");
		
		String ranNum = "";
		for ( int i = 0 ; i < 5 ; i++ ) {
			int tmp = (int)(Math.random() * 10);
			ranNum += tmp;
		}
		int random = Integer.parseInt(ranNum);
		
		// 확장자 유지를 위하여 확장자만 별도 추출
		String name = originFile.getName();
		String ext = null;
		int dot = name.lastIndexOf(".");
		if ( dot != -1 ) { // 파일에 확장자가 있는 경우
			ext = name.substring(dot);
		} else {
			ext = "";
		}
		
		// 변경된 파일명
		String fileName = "spec_" + ft.format(date) + random + ext; 
		
		File newFile = new File(originFile.getParent(), fileName);
		// 원본요소가 존재하는 폴더 내에 ( 파일의 부모는 폴더 )
		// fileName으로 새 파일을 만들겠다 ...
		
		return newFile;
	}

}
