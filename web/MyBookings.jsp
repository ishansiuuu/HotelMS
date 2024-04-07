<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Bookings</title>
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
            <div class="container mx-auto">
                <h1 class="text-3xl font-bold mb-8">My Bookings</h1>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <%
                        String userIdStr = request.getParameter("user_id");
                        if (userIdStr != null) {
                            Integer userId = Integer.parseInt(userIdStr);

                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");

                                String query = "SELECT booking.booking_id, booking.check_in_date, booking.check_out_date, room.room_number, hotel.name AS hotel_name "
                                        + "FROM booking "
                                        + "INNER JOIN room ON booking.room_id = room.room_id "
                                        + "INNER JOIN hotel ON booking.hotel_id = hotel.hotel_id "
                                        + "WHERE booking.user_id = ?";
                                System.out.println("Generated SQL query: " + query);

                                pstmt = conn.prepareStatement(query);
                                pstmt.setInt(1, userId);
                                rs = pstmt.executeQuery();

                                int rowCount = 0; // Initialize row count variable
                                // Loop through the result set and increment row count
                                while (rs.next()) {
                                    rowCount++;
                                    int bookingId = rs.getInt("booking_id");
                                    String checkInDate = rs.getString("check_in_date");
                                    String checkOutDate = rs.getString("check_out_date");
                                    String roomNumber = rs.getString("room_number");
                                    String hotelName = rs.getString("hotel_name");
                    %>
                    <div class="bg-white rounded-lg shadow p-6">
                        <p class="font-semibold text-gray-800">Booking ID: <%= bookingId%></p>
                        <p class="text-gray-600">Hotel: <%= hotelName%></p>
                        <p class="text-gray-600">Room Number: <%= roomNumber%></p>
                        <p class="text-gray-600">Check-in Date: <%= checkInDate%></p>
                        <p class="text-gray-600">Check-out Date: <%= checkOutDate%></p>
                        <form action="CancelBookingServlet" method="post">
                            <input type="hidden" name="booking_id" value="<%= bookingId%>">
                            <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-4">Cancel Booking</button>
                        </form>
                    </div>
                    <%
                                }
                                if (rowCount == 0) {
                                    out.println("No bookings found for user ID: " + userId);
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                if (rs != null) {
                                    rs.close();
                                }
                                if (pstmt != null) {
                                    pstmt.close();
                                }
                                if (conn != null) {
                                    conn.close();
                                }
                            }
                        } else {
                            out.println("User ID parameter is missing.");
                        }
                    %>
                </div>
            </div>
        </section>

        <footer class="bg-gray-900 text-white text-center py-4">
            <p>&copy; 2024 Hotel Booking. All rights reserved.</p>
        </footer>
    </body>

</html>
