package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	
	UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
	
	HttpSession session =req.getSession();
	
	String email=req.getParameter("email");
	String password=req.getParameter("password");

	
//	   if (check == null) { // if check is not checked
//           session.setAttribute("failedmsg", "Please accept the Terms and Condition....");
//           resp.sendRedirect("Login.jsp"); // Redirect to the Login page
//           //return; // Exit early to avoid further processing
//       }
	if("admin@gmail.com".equals(email) && "Admin@123".equals(password))
	{
		User us=new User();
		us.setName("Admin");
		session.setAttribute("userobj", us);
		resp.sendRedirect("admin/home.jsp");
	}else
	{
		User us=dao.login(email, password);
				if(us!=null)
					{
					session.setAttribute("userobj",us);
					resp.sendRedirect("NewFile.jsp");
					}
				else
				{
					session.setAttribute("failedMsg","Email and Password Invalid");
					resp.sendRedirect("Login.jsp");
				
				}
			
		
				 resp.sendRedirect("home.jsp");
	}
}catch(Exception e)
{
	e.printStackTrace();
}
	}
}

	

