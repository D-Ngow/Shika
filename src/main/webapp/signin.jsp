<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signin Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-gray-100">
    <header class="bg-white py-4">
        <div class="container mx-auto flex justify-between items-center">
            <div class="flex items-center">
                <img alt="Logo" class="h-10" height="50" src="https://storage.googleapis.com/a1aa/image/6NJKCHJVWoqFFFKIyQLzpWW8pQxBYBZ89pXXejvfQy8q6SnTA.jpg" width="50"/>
                <span class="ml-2 text-lg font-bold">Interaction</span>
            </div>
            <nav class="space-x-6">
                <a class="text-black" href="#">HOME</a>
                <a class="text-black" href="#">CATEGORIES</a>
                <a class="text-black" href="#">PRODUCTS</a>
                <a class="text-black" href="#">CONTACT</a>
                <a class="text-black" href="#">ACCOUNT</a>
                <a class="text-black" href="#">SEARCH</a>
                <a class="text-black" href="#">MY CART</a>
            </nav>
        </div>
    </header>
    <main class="flex flex-col items-center justify-center min-h-screen">
        <div class="bg-white p-8 rounded shadow-md w-full max-w-md">
            <h1 class="text-2xl font-bold text-center mb-4">SIGNIN</h1>
            <hr class="mb-4"/>
            <form>
                <div class="mb-4">
                    <input class="w-full p-2 border border-gray-300 rounded" placeholder="Email" type="email"/>
                </div>
                <div class="mb-4">
                    <input class="w-full p-2 border border-gray-300 rounded" placeholder="Mật khẩu" type="password"/>
                </div>
                <div class="mb-4 text-right">
                    <a class="text-sm text-gray-600" href="#">Quên mật khẩu?</a>
                </div>
                <div class="mb-4">
                    <button class="w-full bg-black text-white p-2 rounded" type="submit">Đăng nhập</button>
                </div>
                <div class="mb-4">
                    <button class="w-full border border-gray-300 p-2 rounded" type="button">Đăng ký</button>
                </div>
                <div class="text-center mb-4">
                    <span class="text-gray-600">Hoặc</span>
                </div>
                <div class="flex justify-center space-x-4">
                    <a class="text-2xl text-gray-600" href="#"><i class="fab fa-google"></i></a>
                    <a class="text-2xl text-gray-600" href="#"><i class="fab fa-facebook"></i></a>
                </div>
            </form>
        </div>
    </main>
    <footer class="bg-black text-white py-8">
        <div class="container mx-auto flex justify-between">
            <div>
                <img alt="Logo" class="h-10 mb-4" height="50" src="https://storage.googleapis.com/a1aa/image/6NJKCHJVWoqFFFKIyQLzpWW8pQxBYBZ89pXXejvfQy8q6SnTA.jpg" width="50"/>
                <p>© 2024 Shiko</p>
            </div>
            <div class="flex space-x-16">
                <div>
                    <h3 class="font-bold mb-2">Info</h3>
                    <ul>
                        <li><a class="text-gray-400" href="#">Find a store</a></li>
                        <li><a class="text-gray-400" href="#">Discount</a></li>
                        <li><a class="text-gray-400" href="#">Gift</a></li>
                        <li><a class="text-gray-400" href="#">Feedback</a></li>
                        <li><a class="text-gray-400" href="#">Become a member</a></li>
                    </ul>
                </div>
                <div>
                    <h3 class="font-bold mb-2">Shop</h3>
                    <ul>
                        <li><a class="text-gray-400" href="#">Men</a></li>
                        <li><a class="text-gray-400" href="#">Women</a></li>
                        <li><a class="text-gray-400" href="#">Kids</a></li>
                        <li><a class="text-gray-400" href="#">Collections</a></li>
                        <li><a class="text-gray-400" href="#">Contacts</a></li>
                    </ul>
                </div>
                <div>
                    <h3 class="font-bold mb-2">About</h3>
                    <ul>
                        <li><a class="text-gray-400" href="#">News</a></li>
                        <li><a class="text-gray-400" href="#">Careers</a></li>
                    </ul>
                </div>
            </div>
            <div class="flex space-x-4">
                <a class="text-gray-400" href="#"><i class="fab fa-facebook-f"></i></a>
                <a class="text-gray-400" href="#"><i class="fab fa-twitter"></i></a>
                <a class="text-gray-400" href="#"><i class="fab fa-instagram"></i></a>
                <a class="text-gray-400" href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
        <div class="text-center mt-4">
            <a class="text-gray-400" href="#">Privacy &amp; Cookie Policy</a>
        </div>
    </footer>
</body>
</html>