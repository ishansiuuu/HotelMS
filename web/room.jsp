<%@ page import="java.sql.*" %>
<%
    int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
    String guestName = (String) session.getAttribute("name");
    String guestEmail = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rooms</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>

    <body class="bg-gray-100">
        <nav class="bg-gray-900 text-white p-4">
            <div class="container mx-auto flex justify-between items-center">
                <a href="index.jsp" class="text-2xl font-bold">HotelMS</a>
                <img src=""  class="h-8 mx-auto mb-2">


                <ul class="flex space-x-4">
                    <li><a href="index.jsp" class="hover:text-gray-300">Home</a></li>
                    <li><a href="about.jsp" class="hover:text-gray-300">About</a></li>
                    <li><a href="rooms.jsp" class="hover:text-gray-300">Rooms</a></li>
                    <li><a href="hotels.jsp" class="hover:text-gray-300">Hotels</a></li>
                    <% if (request.getSession().getAttribute("name") != null) {%>
                    <li><a href="MyBookings.jsp?user_id=<%= session.getAttribute("user_id")%>" class="hover:text-gray-300">My Bookings</a></li>
                    <li><a href="LogoutServlet" class="hover:text-gray-300">Logout</a></li>
                        <% } else { %>
                    <li><a href="login.jsp" class="hover:text-gray-300">Login</a></li>
                    <li><a href="register.jsp" class="hover:text-gray-300">Register</a></li>
                        <% }%>
                </ul>

            </div>
        </nav>

        <section class="py-16">
            <div class="container mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                        String roomQuery = "SELECT * FROM room WHERE hotel_id=" + hotelId + " AND Availability='Available'";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(roomQuery);

                        while (rs.next()) {
                            int roomId = rs.getInt("room_id");
                            String roomNumber = rs.getString("room_number");
                            int capacity = rs.getInt("capacity");
                            double price = rs.getDouble("price");
                %>
                <div class="bg-white rounded-lg shadow p-6">
                    <form action="book_room.jsp?room_id=<%= roomId%>&hotel_id=<%= hotelId%>" method="post">
                        <p class="text-xl font-bold mb-2">Room Number: <%= roomNumber%></p>
                        <p><strong>Capacity:</strong> <%= capacity%> guests</p>
                        <p><strong>Price:</strong> $<%= price%></p>
                        <div class="mt-4">
                            <label for="check_in_date" class="block text-sm font-medium text-gray-700">Check-in Date:</label>
                            <input type="date" id="check_in_date" name="check_in_date" required
                                   class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                        </div>
                        <div class="mt-4">
                            <label for="check_out_date" class="block text-sm font-medium text-gray-700">Check-out Date:</label>
                            <input type="date" id="check_out_date" name="check_out_date" required
                                   class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                        </div>
                        <div class="mt-4">
                            <label for="guest_name" class="block text-sm font-medium text-gray-700">Guest Name:</label>
                            <input type="text" id="guest_name" name="guest_name" required value="<%= guestName%>"
                                   class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                        </div>
                        <div class="mt-4">
                            <label for="guest_email" class="block text-sm font-medium text-gray-700">Guest Email:</label>
                            <input type="email" id="guest_email" name="guest_email" required value="<%= guestEmail%>"
                                   class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                        </div>
                        <div class="mt-4">
                            <button type="submit"
                                    class="inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                Book Now
                            </button>
                        </div>
                    </form>

                </div>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) {
                                rs.close();
                            }
                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </div>
        </section>

        <footer class="bg-gray-900 text-white text-center py-4">
            <p>&copy; 2024 Hotel Booking. All rights reserved.</p>
        </footer>
    </body>

</html>
