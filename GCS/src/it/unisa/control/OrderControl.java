package it.unisa.control;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import it.unisa.model.*;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class OrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		UserBean user=(UserBean)request.getSession().getAttribute("currentSessionUser");
		
		try {
			if(action!=null) {
				if(action.equalsIgnoreCase("checkout")){
					Cart cart= (Cart) request.getSession().getAttribute("cart");
					if(cart == null) {
						cart = new Cart();
						request.getSession().setAttribute("cart", cart);
					}
					else if(cart.getSize()==0) {
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
				    	 dispatcher.forward(request, response);
					}
					else if(user==null) {
						response.sendRedirect("login.jsp");
					}
					else{
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RiepilogoOrdine.jsp");
						dispatcher.forward(request, response);
					}
				}
				else if(action.equalsIgnoreCase("conferma")){
					Cart cart= (Cart) request.getSession().getAttribute("cart");
					OrderBean order=new OrderBean();
					order.setPrezzoTot(cart.getTotPrice());
					order.setUtente(user.getEmail());
					order=OrderDAO.doSave(order);
					DetailDAO.doSave(cart, OrderDAO.getIdUtente(order.getUtente(), order.getDataEff()));
					request.getSession().setAttribute("cart", new Cart());
					request.getSession().removeAttribute("orders");
					request.getSession().setAttribute("orders", OrderDAO.doRetrieveAllByUser(user.getEmail()));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("detail")){
					int id = Integer.parseInt(request.getParameter("id"));
					request.getSession().removeAttribute("products");
					request.getSession().setAttribute("products", DetailDAO.doRetrieveProducts(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderDetailsView.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("filterDate")){
					String inizio=request.getParameter("inizio");
					String fine=request.getParameter("fine");
					Collection<?> orders = (Collection<?>) OrderDAO.doRetrieveAllbyDate(inizio, fine);
					request.setAttribute("orders", orders);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/OrdersView.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("filterUser")){
					String utente=request.getParameter("user");
					Collection<?> orders = (Collection<?>) OrderDAO.doRetrieveAllByUser(utente);
					request.setAttribute("orders", orders);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/OrdersView.jsp");
					dispatcher.forward(request, response);
				}
			}
		}
		catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
