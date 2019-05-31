package oms.controller.payment;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DerbyUtil;

/**
 * Servlet implementation class PayServlet
 */
@WebServlet("/PayServlet")
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("id");
		List<Map<String,Object>> orders = DerbyUtil.select("select * from t_order where id='"+orderid+"'", new Object[] {});
		Map<String,Object> order = orders.get(0);
		DerbyUtil.update("insert into t_payment values(?,?,?,?,?,?,?,?,?,?,?)", new Object[] {
				System.currentTimeMillis(),new Date(),
				order.get("MOVIEID"),order.get("MOVIETITLE"),"saved",order.get("AMOUNT"),order.get("VALUE"),
				order.get("USERID"),order.get("PRICE"),orderid,""
		});
		request.getRequestDispatcher("/payment.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
