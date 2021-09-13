package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import it.unisa.model.*;
/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("search")) {
					Collection<ProductBean> list =(Collection<ProductBean>)ProductDAO.doRetrieveAll();
					ArrayList<String> result=new ArrayList<String>();
					String s=request.getParameter("search").toLowerCase();
					for (ProductBean productBean : list) {
						if(productBean.getName().toLowerCase().contains(s)) {
							result.add(productBean.getName()+","+productBean.getCode());
						}
					}
					String json = new Gson().toJson(result);
					response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");
			        response.getWriter().write(json);
				}
				else if (action.equalsIgnoreCase("ricerca")) {
					Collection<ProductBean> list =(Collection<ProductBean>)ProductDAO.doRetrieveAll();
					ArrayList<ProductBean> result=new ArrayList<ProductBean>();
					String s=request.getParameter("s").toLowerCase();
					for (ProductBean productBean : list) {
						if(productBean.getName().toLowerCase().contains(s)) {
							result.add(productBean);
						}
					}
					request.setAttribute("trovati", result);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ricerca.jsp");
					dispatcher.forward(request, response);
				}
				else if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					ProductBean bean=ProductDAO.doRetrieveByKey(id);
					request.setAttribute("product", bean);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailsView.jsp");
					dispatcher.forward(request, response); 
				}  else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductDAO.doDelete(id);
					request.removeAttribute("products");
					request.setAttribute("products", ProductDAO.doRetrieveAll());
					if(request.getSession().getAttribute("adminRoles")!=null) {
						response.sendRedirect("admin/adminView.jsp");
					}
					else {
						response.sendRedirect("index.jsp");
					}
				}  else if (action.equalsIgnoreCase("insert")) {
					ProductDAO.doSave(getProductbyRequest(request, response));
					request.setAttribute("products", ProductDAO.doRetrieveAll());
					if(request.getSession().getAttribute("adminRoles")!=null)
						response.sendRedirect("admin/adminView.jsp");
					else response.sendRedirect("index.jsp");
				} 
			  else if (action.equalsIgnoreCase("modify")) {
					 ProductBean bean=ProductDAO.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
					 ProductBean nuovo=getProductbyRequest(request, response);
					 nuovo.setCode(bean.getCode());
					 ProductDAO.doUpdate(nuovo);
					 request.setAttribute("products", ProductDAO.doRetrieveAll());
					 if(request.getSession().getAttribute("adminRoles")!=null)
						 response.sendRedirect("admin/adminView.jsp");
					 else response.sendRedirect("index.jsp");
				 } 
			}
			else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private ProductBean getProductbyRequest(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("nome");
		String description = request.getParameter("descrizione");
		double price = Double.parseDouble(request.getParameter("prezzo"));
		int quantity = Integer.parseInt(request.getParameter("quantita"));
		double sconto = Double.parseDouble(request.getParameter("sconto"));
		double iva = Double.parseDouble(request.getParameter("iva"));
		String thumb= request.getParameter("thumb");
		ProductBean bean = new ProductBean();
		bean.setName(name);
		bean.setDescription(description);
		bean.setPrice(price);
		bean.setQuantity(quantity);
		bean.setIva(iva);
		bean.setSconto(sconto);
		bean.setThumbnail(thumb);
		return bean;
	}
	
}
