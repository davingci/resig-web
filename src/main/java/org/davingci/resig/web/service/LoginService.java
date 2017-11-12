
package org.davingci.resig.web.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MultivaluedHashMap;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response;

import org.davingci.resig.web.pojo.User;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;


/**
 * Servlet implementation class LoginService
 */
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target("http://39.106.21.117:8080/v1/api/user/login");
		MultivaluedMap<String, String> postForm = new MultivaluedHashMap<String, String>();
		postForm.add("username", username);
		postForm.add("password", password);
		
		
		Response serverResponse = target.request().post(Entity.form(postForm));
		int status = serverResponse.getStatus();
		String serverResponseData = serverResponse.readEntity(String.class);
		
		
		switch(status) {
			case 200:
				JSONObject serverResponseJSONObject = JSON.parseObject(serverResponseData);
				
				int code = serverResponseJSONObject.getInteger("code");
				if(code==200) {
					User user = JSON.parseObject(serverResponseJSONObject.getString("data"),User.class);
					HttpSession session=request.getSession();  
					session.setAttribute("userId",user.getUserId());
					session.setAttribute("username", user.getUsername());
				}
				
				break;
			default:
				break;
				
		}
		
		
		System.out.println(serverResponseData);
		
		response.getWriter().write(serverResponseData);	
		response.getWriter().flush();
		response.getWriter().close();
	}

}
