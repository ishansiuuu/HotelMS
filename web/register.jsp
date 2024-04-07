<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - HotelMS</title>
    <!-- Include Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    
   <style>
        body {
            background-image: url('https://thumbs.dreamstime.com/b/autumn-nature-landscape-colorful-forest-autumn-nature-landscape-colorful-forest-morning-sunlight-131400332.jpg'); /* Replace 'path/to/your/image.jpg' with the actual path to your image */
            background-size: cover;
            background-position: center;
            height: 100vh; 
        }
    </style>
</head>

<body class="bg-gray-100 min-h-screen flex flex-col">
    <!-- Navigation -->
    <nav class="bg-gray-900 text-white p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a href="index.jsp" class="text-2xl font-bold">HotelMS</a>
            <ul class="flex space-x-4">
                <li><a href="index.jsp" class="hover:text-gray-300">Home</a></li>
                <li><a href="rooms.jsp" class="hover:text-gray-300">Rooms</a></li>
                <li><a href="hotels.jsp" class="hover:text-gray-300">Hotels</a></li>
                <li><a href="register.jsp" class="hover:text-gray-300">Register</a></li>
                <li><a href="login.jsp" class="hover:text-gray-300">Login</a></li>
                <li><a href="about.jsp" class="hover:text-gray-300">About</a></li>
                <li><a href="booking.jsp" class="hover:text-gray-300">BookNow</a></li>


            </ul>
        </div>
    </nav>
    <!-- Register Form -->
    <div class="container my-auto mx-auto max-w-md bg-white p-10 rounded-lg shadow-md">
        <h2 class="text-3xl font-bold mb-4">Create an Account</h2>
<form action="RegisterServlet" method="post">
            
            <div class="mb-4">
                <label for="name" class="block text-gray-700">Full Name</label>
                <input type="text" id="name" name="rn" class="w-full mt-1 px-4 py-2 border rounded-md">
            </div>
            <div class="mb-4">
                <label for="email" class="block text-gray-700">Email Address</label>
                <input type="email" id="email" name="fn" class="w-full mt-1 px-4 py-2 border rounded-md">
            </div>
                <div class="mb-4">
                <label for="mobile" class="block text-gray-700">Mobile Number</label>
                <input type="tel" id="mobile" name="ln" class="w-full mt-1 px-4 py-2 border rounded-md">
            </div>
             
            <div class="mb-4">
                <label for="password" class="block text-gray-700">Password</label>
                <input type="password" id="password" name="dept" class="w-full mt-1 px-4 py-2 border rounded-md">
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">Register</button>
        </form>
    </div>
</body>

</html>
