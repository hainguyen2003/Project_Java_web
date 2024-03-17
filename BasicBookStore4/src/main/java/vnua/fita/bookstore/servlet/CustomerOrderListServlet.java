package vnua.fita.bookstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vnua.fita.bookstore.bean.Order;
import vnua.fita.bookstore.model.BookDAO;
import vnua.fita.bookstore.model.OrderDAO;
import vnua.fita.bookstore.util.MyUtil;

/**
 * Servlet implementation class CustomerOrderListServlet
 */
@WebServlet(urlPatterns = {"/CustomerOrderList"})
public class CustomerOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		orderDAO = new OrderDAO(jdbcURL, jdbcUsername, jdbcPassword);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String customerUserName = MyUtil.getLoginedUser(request.getSession()).getUsername();
		List<Order> orderListOfCustomer = orderDAO.getOrderList(customerUserName);
		request.setAttribute("orderListOfCustomer", orderListOfCustomer);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Views/customerOrderListView.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}