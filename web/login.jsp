<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - HotelMS</title>
        <!-- Include Tailwind CSS -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

        <style>
            body {
                background-image: url('data:image/jpeg;base64,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'); /* Replace 'path/to/your/image.jpg' with the actual path to your image */
                background-size: cover;
                background-position: center;
                height: 100vh;
            }
        </style>
    </head>

    <body class="bg-gray-100 flex flex-col">
        <!-- Navigation -->
        <nav class="bg-gray-900 text-white p-4">
            <div class="container mx-auto flex justify-between items-center">
                <a href="index.jsp" class="text-2xl font-bold">HotelMS</a>
                <ul class="flex space-x-4">
                    <li><a href="index.jsp" class="hover:text-gray-300">Home</a></li>
                    <li><a href="rooms.jsp" class="hover:text-gray-300">Rooms</a></li>
                    <li><a href="hotels.jsp" class="hover:text-gray-300">Hotels</a></li>
                    <li><a href="about.jsp" class="hover:text-gray-300">About</a></li>
                    <li><a href="login.jsp" class="hover:text-gray-300">Login</a></li>
                    <li><a href="register.jsp" class="hover:text-gray-300">Register</a></li>
                    <li><a href="booking.jsp" class="hover:text-gray-300">BookNow</a></li>


                </ul>
            </div>
        </nav>

        <!-- Login Form -->
        <div class="container mx-auto my-auto max-w-md bg-white p-10 rounded-lg shadow-md">
            <h2 class="text-3xl font-bold mb-8">Login to HotelMS</h2>
            <form action="LoginServlet" method="post">
                <div class="mb-4">
                    <label for="email" class="block text-gray-700">Username</label>
                    <input type="text" id="email" name="email" class="w-full mt-1 px-4 py-2 border rounded-md">
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-gray-700">Password</label>
                    <input type="password" id="password" name="password" class="w-full mt-1 px-4 py-2 border rounded-md">
                </div>
                <button type="submit" class="w-full bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">Login</button>
            </form>

            <div class="mt-4">
                <a href="#" class="text-sm text-blue-500 hover:underline">Forgot Password?</a>
            </div>
        </div>
    </body>

</html>
