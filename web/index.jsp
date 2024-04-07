<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hotel Management System</title>
        <!-- Include Tailwind CSS -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">



    </head>

    <body class="bg-gray-100 flex flex-col min-h-screen">


        <!-- Navigation -->
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

        <!-- Hero Section -->
        <section class="bg-gray-700 text-white py-16">


            <div class="container mx-auto text-center">
                <h1 class="text-4xl font-bold mb-4">Welcome to HotelMS <span><%= request.getSession().getAttribute("name")%><%= request.getSession().getAttribute("user_id")%></span></h1>
                <p class="text-lg mb-8">Your ultimate destination for managing your hotel efficiently.</p>
                <a href="booking.jsp" class="bg-yellow-500 text-gray-900 px-6 py-3 rounded-full font-bold uppercase tracking-wide hover:bg-yellow-600">Book Now</a>

            </div>
        </section>

        <!-- Features Section -->
        <section class="pt-10 flex-grow">
            <div class="container mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
                <!-- Feature 1 -->
                <div class="bg-white rounded-lg shadow p-8">
                    <h2 class="text-2xl font-bold mb-4">Manage Rooms</h2>
                    <p>Efficiently manage your hotel rooms with our intuitive interface. Connect uEfficiently manage your hotel rooms with our intuitive interface. Connect us in the phone or other email services.</p>
                </div>
                <!-- Feature 2 -->
                <div class="bg-white rounded-lg shadow p-8">
                    <h2 class="text-2xl font-bold mb-4">Track Bookings</h2>
                    <p>Keep track of all your bookings and reservations in one place.</p>
                </div>
                <!-- Feature 3 -->
                <div class="bg-white rounded-lg shadow p-8">
                    <h2 class="text-2xl font-bold mb-4">Streamline Operations</h2>
                    <p>Streamline your hotel operations to provide exceptional guest experiences.</p>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-gray-900 text-white text-center py-4 mt-8">
            <p>&copy; 2024 HotelMS. All rights reserved.</p>
        </footer>
    </body>

</html>
