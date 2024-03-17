package vnua.fita.bookstore.utils;

import java.util.Map;

import javax.servlet.http.HttpSession;

import vnua.fita.bookstore.bean.Cart;
import vnua.fita.bookstore.bean.CartItem;
import vnua.fita.bookstore.bean.User;

public class MyUtil {
	public static void storeLoginedUser(HttpSession session, User loginedUser) {
		session.setAttribute("loginedUser", loginedUser);
	}
	
	//lưu trữ thông tin giỏ hàng vào Session
	public static void storeCart(HttpSession session, Cart cart) {
		//trên JSP có thể truy cập thông qua ${loginedUser}
		session.setAttribute("cartOfCustomer", cart);
	}
	
	//lấy thông tin giỏ hàng lưu trữ trong Session
	public static Cart getCartOfCustomer(HttpSession session) {
		Cart cartOfCustomer = (Cart) session.getAttribute("cartOfCustomer");
		return cartOfCustomer;
	}
	
	public static String getPathInfoFromServletPath(String path) {
	    if (path == null || path.isEmpty()) {
	        return ""; // Hoặc có thể ném một ngoại lệ
	    }

	    String[] result = path.split("/");
	    if (result.length == 0) {
	        return "";
	    }

	    return result[result.length - 1];
	}
}
