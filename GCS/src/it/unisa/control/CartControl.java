package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;

/**
 * Servlet implementation class CartControl
 */
@WebServlet("/CartControl")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartControl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("add") || action.equalsIgnoreCase("addCartDetails")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductBean b=cart.getProduct(id);
					if(cart.isInCart(id))
						cart.increaseProductQ(b);
					else {
						ProductBean bean= (ProductBean) ProductDAO.doRetrieveByKey(id);
						bean.setCartQuantity(1);
						bean.setTot(bean.getPrice());
						cart.addProduct(bean);
					}
					request.getSession().setAttribute("cart", cart);
					if(action.equalsIgnoreCase("addCartDetails")) {
						request.removeAttribute("product");
						request.setAttribute("product", ProductDAO.doRetrieveByKey(id));
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailsView.jsp");
						dispatcher.forward(request, response);
					}
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(ProductDAO.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
				}
				else if (action.equalsIgnoreCase("Cart")) {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
				}else if (action.equalsIgnoreCase("deleteCart")) {
					request.getSession().setAttribute("cart", new Cart());
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
				}
				else if (action.equalsIgnoreCase("decreaseQ")) {
					ProductBean b= cart.getProduct(Integer.parseInt(request.getParameter("id")));
					cart.decreaseProductQ(b);
					request.getSession().setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
				}
				else if (action.equalsIgnoreCase("increaseQ")) {
					ProductBean b= cart.getProduct(Integer.parseInt(request.getParameter("id")));
					cart.increaseProductQ(b);
					request.getSession().setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
				}
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
