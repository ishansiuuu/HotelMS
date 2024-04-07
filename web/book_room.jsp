<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hotel Management System</title>
        <!-- Include Tailwind CSS -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">



    </head>
<%@ page import="java.sql.*, java.util.*" %>
<%
    int roomId = Integer.parseInt(request.getParameter("room_id"));
    int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
    String checkInDate = request.getParameter("check_in_date");
    String checkOutDate = request.getParameter("check_out_date");
    String guestName = request.getParameter("guest_name");
    String guestEmail = request.getParameter("guest_email");

    int userId = (int) session.getAttribute("user_id");

    Connection conn = null;
    PreparedStatement pstmtBooking = null;
    PreparedStatement pstmtUpdateRoom = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
        conn.setAutoCommit(false);

        String insertBookingQuery = "INSERT INTO booking (room_id, hotel_id, check_in_date, check_out_date, guest_name, guest_email, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmtBooking = conn.prepareStatement(insertBookingQuery);
        pstmtBooking.setInt(1, roomId);
        pstmtBooking.setInt(2, hotelId);
        pstmtBooking.setString(3, checkInDate);
        pstmtBooking.setString(4, checkOutDate);
        pstmtBooking.setString(5, guestName);
        pstmtBooking.setString(6, guestEmail);
        pstmtBooking.setInt(7, userId);
        pstmtBooking.executeUpdate();

        String updateRoomQuery = "UPDATE room SET availability = 'Unavailable' WHERE room_id = ? AND hotel_id = ?";
        pstmtUpdateRoom = conn.prepareStatement(updateRoomQuery);
        pstmtUpdateRoom.setInt(1, roomId);
        pstmtUpdateRoom.setInt(2, hotelId);
        pstmtUpdateRoom.executeUpdate();

        conn.commit();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booking Confirmation</title>
        <script src="https://cdn.jsdelivr.net/npm/pdf-lib@1.18.0/dist/pdf-lib.js"></script>
    </head>
    <body>
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
        <h1>Booking Successful</h1>
        <p>Thank you, <%= guestName%>, your booking for Room ID <%= roomId%> at Hotel ID <%= hotelId%> has been confirmed.</p>
        <p>Check-in Date: <%= checkInDate%></p>
        <p>Check-out Date: <%= checkOutDate%></p>
        <p>An email confirmation has been sent to <%= guestEmail%>.</p>

        <button id="downloadButton">Download Bill</button>

        <script>
            document.getElementById("downloadButton").addEventListener("click", async function () {
                const pdfDoc = await PDFLib.PDFDocument.create();
                const page = pdfDoc.addPage([600, 400]);
                const {width, height} = page.getSize();

                page.drawText("Booking Details:", {x: 50, y: height - 50});
                page.drawText("Room ID: <%= roomId%>", {x: 50, y: height - 100});
                page.drawText("Hotel ID: <%= hotelId%>", {x: 50, y: height - 150});
                page.drawText("Check-in Date: <%= checkInDate%>", {x: 50, y: height - 200});
                page.drawText("Check-out Date: <%= checkOutDate%>", {x: 50, y: height - 250});
                page.drawText("Guest Name: <%= guestName%>", {x: 50, y: height - 300});
                page.drawText("Guest Email: <%= guestEmail%>", {x: 50, y: height - 350});

                const pdfBytes = await pdfDoc.save();
                const blob = new Blob([pdfBytes], {type: "application/pdf"});
                const url = window.URL.createObjectURL(blob);

                const a = document.createElement("a");
                a.href = url;
                a.download = "bill.pdf";
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
            });
        </script>
    </body>
</html>
<%
    } catch (Exception e) {
        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        e.printStackTrace();
    } finally {
        try {
            if (pstmtBooking != null) {
                pstmtBooking.close();
            }
            if (pstmtUpdateRoom != null) {
                pstmtUpdateRoom.close();
            }
            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
