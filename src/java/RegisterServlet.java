import java.sql.*;
import java.io.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String regno = request.getParameter("rn");
        String fn = request.getParameter("fn");
        String ln = request.getParameter("ln");
        String dept = request.getParameter("dept");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");

            // PreparedStatement with column names specified
            String query = "INSERT INTO lms (name, email, mobile, password) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, regno);
            ps.setString(2, fn);
            ps.setString(3, ln);
            ps.setString(4, dept);

            int i = ps.executeUpdate();

            pw.println(i + " record(s) inserted successfully");
            response.sendRedirect("login.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            pw.println("Exception occurred: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
