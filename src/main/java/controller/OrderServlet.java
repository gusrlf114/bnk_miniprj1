package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.OrderDAO;
import dto.OrderDTO;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    
    // GET 요청: 무조건 주문 등록 폼 화면으로 이동
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/orderForm.jsp").forward(request, response);
    }

    // POST 요청: 폼 데이터를 데이터베이스에 등록
 // POST 요청: 폼 데이터를 데이터베이스에 등록
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // 브라우저로 한글 알림창을 보내기 위한 설정 (매우 중요!)
        response.setContentType("text/html; charset=UTF-8"); 
        
        OrderDTO order = new OrderDTO();
        order.setOrderno(request.getParameter("orderno"));
        order.setShopno(request.getParameter("shopno"));
        order.setOrderdate(request.getParameter("orderdate"));
        order.setPcode(request.getParameter("pcode"));
        order.setAmount(Integer.parseInt(request.getParameter("amount")));
        
        OrderDAO dao = new OrderDAO();
        int result = dao.insertOrder(order);
        
        // 자바스크립트 출력을 위한 PrintWriter 객체 생성
        java.io.PrintWriter out = response.getWriter();
        
        if(result > 0) {
            // 등록 성공 시 알림창 띄우고 메인화면(index.jsp)으로 이동
            out.println("<script>");
            out.println("alert('주문등록이 정상적으로 등록 되었습니다!');");
            out.println("location.href='main.jsp';"); // 시작화면 파일명에 맞게 변경하세요.
            out.println("</script>");
        } else {
            // 실패 시 뒤로 가기
            out.println("<script>");
            out.println("alert('등록 중 오류가 발생했습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
        
        out.flush();
    }
}