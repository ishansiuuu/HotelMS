<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Hotel LMS</title>
    <!-- Include Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Include Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 h-screen flex flex-col">
    <!-- Navbar -->
    
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
    
    <!-- Your navbar code here -->

    <!-- About Section -->
    <section class="container mx-auto py-8 flex flex-col flex-grow">
       
 <h1 class="text-3xl font-bold text-gray-900 mb-4">Welcome to Hotel LMS</h1>
    <h3 class="text-gray-900 font-bold">Experience unparalleled convenience and luxury with our premier hotel booking system. Discover the perfect accommodations tailored to your preferences, whether you're planning a relaxing vacation or an exciting weekend getaway. Our platform offers a curated selection of the finest hotels worldwide, ensuring you find the ideal stay for your every need. From exquisite amenities to impeccable service, embark on a journey of comfort and indulgence with Hotel LMS.</h3>
            <!-- Additional content about the hotel -->
    </section>
            
    <div class="mt-8 mc-6 gap-4">
                    <div class="flex justify-center items-center rounded-lg overflow-hidden bg-gray-200 h-80">

            <img src="https://img.freepik.com/premium-photo/online-hotel-accommodation-booking-website-provide-modish-reservation-system_31965-41493.jpg" alt="Photo 1" class="rounded-lg">
           
            <!-- Add more photos as needed -->
        </div>
         </div>

<div class="flex justify-center space-x-8" style="margin-top: 100px;">
    <a href="https://www.facebook.com/premelone01" class="text-gray-900 hover:text-white text-6xl"><i class="fab fa-facebook-f"></i></a>
    <a href="#" class="text-gray-900 hover:text-white text-6xl"><i class="fab fa-instagram"></i></a>
    <a href="#" class="text-gray-900 hover:text-white text-6xl"><i class="fab fa-twitter"></i></a>
    <a href="#" class="text-gray-900 hover:text-white text-6xl"><i class="fab fa-linkedin-in"></i></a>
</div>


    <!-- Footer -->
    <footer class="bg-gray-900 text-white text-center py-4 mt-auto">
        <p>&copy; 2024 Hotel LMS. All rights reserved.</p>
    </footer>
</body>
</html>
