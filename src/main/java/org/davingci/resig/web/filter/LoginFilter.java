/**
 *@author huangdongxu
 *@Date Oct 20, 2017
 *@description
 通过Filter进行登录验证
*/
package org.davingci.resig.web.filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	
	private Set<String> prefixIignores = new HashSet<String>();
    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest)request;
		HttpServletResponse hResponse = (HttpServletResponse)response;
		HttpSession session= hRequest.getSession();
		String cp = hRequest.getContextPath();
		if(canIgnore(hRequest)) {
			chain.doFilter(request, response);
			return;
		}
		
		if(session.getAttribute("userId") == null) {
			String loginPage = cp + "/login.jsp";
			System.out.println(loginPage);
			hResponse.sendRedirect(loginPage);
		}
		else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		String cp = fConfig.getServletContext().getContextPath();    
        String ignoresParam = fConfig.getInitParameter("ignores");    
        String[] ignoreArray = ignoresParam.split(";");    
        for (String s : ignoreArray) {    
            prefixIignores.add(cp + s);    
        }   
	}
	
	private boolean canIgnore(HttpServletRequest request) {    
        String url = request.getRequestURI();   
        //System.out.println(url);
        for (String ignore : prefixIignores) {    
            if (url.startsWith(ignore)) {    
                return true;    
            }    
        }    
        return false;    
    }  

}
