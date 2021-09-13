package it.unisa.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import it.unisa.model.*;

/**
 * Servlet implementation class LoginControl
 */
@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action!=null) {
			if(action.equalsIgnoreCase("login")) {
				try {
					HttpSession session = request.getSession();
					String un=request.getParameter("un");
					String pw=request.getParameter("pw");
					UserBean user= new UserBean();
				    user.setEmail(un);
				    user.setPassword(pw);
				    user = UserDAO.doRetrieve(user);
				    String json ="";
				    if (user.isValid()){
				    	json= new Gson().toJson(user);
				    	session.setAttribute("currentSessionUser", user);
				    	request.getSession().removeAttribute("orders");
						request.getSession().setAttribute("orders", OrderDAO.doRetrieveAllByUser(user.getEmail()));
				    }
			    	response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");
			        response.getWriter().write(json);
				} 		
				catch (Throwable e){
					e.printStackTrace();
				    System.out.println(e); 
				}
			}
			else if(action.equalsIgnoreCase("registration")) {
				UserBean bean= new UserBean();
				bean.setFirstName(request.getParameter("name"));
				bean.setLastName(request.getParameter("surname"));
				bean.setEmail(request.getParameter("email"));
				bean.setPassword(request.getParameter("pw"));
				bean.setAddress(request.getParameter("address"));
				bean.setPAN(request.getParameter("PAN"));
				bean.setCVV(request.getParameter("CVV"));
				bean.setExpDate(request.getParameter("expDate"));
				bean.setPhoneNumber(request.getParameter("tel"));
				UserDAO.doSave(bean);
				bean.setValid(true);
				request.getSession().setAttribute("currentSessionUser", bean);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
		    	dispatcher.forward(request, response); 
			}
			else if(action.equalsIgnoreCase("admin")) {
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String redirectedPage;
				try {
					AdminBean ad= new AdminBean();
					ad.setUserName(username);
					ad.setPassword(password);
					AdminDAO.doRetrieve(ad);
					if(ad.isValid()) {
						request.removeAttribute("currentSessionUser");
						request.getSession().setAttribute("adminRoles", true);
						redirectedPage = "/admin/adminView.jsp";
					}
					else throw new Exception();
				} catch (Exception e) {
					request.getSession().setAttribute("adminRoles", false);
					redirectedPage = "/adminLogin.jsp";
				}
				response.sendRedirect(request.getContextPath() + redirectedPage);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}