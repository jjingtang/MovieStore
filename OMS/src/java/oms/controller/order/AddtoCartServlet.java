package oms.controller.order;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oms.model.User;
import util.DerbyUtil;

/**
 * Servlet implementation class AddtoCartServlet
 */
@WebServlet("/AddtoCartServlet")
public class AddtoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddtoCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = System.currentTimeMillis()+"";
		String movieid = request.getParameter("id");//get movie id
		List<Map<String,Object>> list= DerbyUtil.select("select * from movies where id='"+movieid+"'",new Object[] {});
		String movietitle = list.get(0).get("TITLE")+"";
		String price = list.get(0).get("PRICE")+"";
		String value = list.get(0).get("PRICE")+"";
		String status = "created";
		String email = (String)request.getSession().getAttribute("email");
		DerbyUtil.update("insert into t_order(id,createtime,movieid,movietitle,status,amount,value,userid,price)values(?,?,?,?,?,?,?,?,?) ", 
				new Object[] {id,new Date(),movieid,movietitle,status,1,value,email,price});
		request.getRequestDispatcher("/cart.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
