package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import wrapper.EncryptWrapper;

@WebFilter(filterName = "encrypt", servletNames= {"MemberInsertServlet","LoginServlet", "CheckPwdServlet","UpdatePwdServlet","DeleteMemberServlet"})
public class EncryptFilter implements Filter {

    public EncryptFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 매개변수 ServletRequest를
		// HttpServletRequest로 캐스팅
		HttpServletRequest hRequest = (HttpServletRequest)request;
		
		// 암호화 래퍼 객체 생성
		EncryptWrapper encWrapper = new EncryptWrapper(hRequest);
		
		chain.doFilter(encWrapper, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
