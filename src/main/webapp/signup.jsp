<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
 <head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>
   Signup Page
  </title>
  <script src="https://cdn.tailwindcss.com">
  </script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
 </head>
 <body class="bg-gray-100">
  <header class="flex justify-between items-center p-4 bg-white shadow-md">
   <div class="flex items-center">
    <img alt="Logo" class="h-10" height="50" src="https://storage.googleapis.com/a1aa/image/leEpelTEVultEUtefSwAlMDoePUJACtvwrG0iYheBeB6zeSnTA.jpg" width="50"/>
    <span class="ml-2 text-lg font-bold">
     Interaction
    </span>
   </div>
   <nav class="space-x-4">
    <a class="text-black" href="#">
     HOME
    </a>
    <a class="text-black" href="#">
     CATEGORIES
    </a>
    <a class="text-black" href="#">
     PRODUCTS
    </a>
    <a class="text-black" href="#">
     CONTACT
    </a>
    <a class="text-black" href="#">
     ACCOUNT
    </a>
    <a class="text-black" href="#">
     SEARCH
    </a>
    <a class="text-black" href="#">
     MY CART
    </a>
   </nav>
  </header>
  <main class="flex flex-col items-center mt-10">
   <h1 class="text-3xl font-bold mb-4">
    SIGNUP
   </h1>
   <div class="w-full max-w-md bg-white p-8 shadow-md">
    <form class="space-y-4"  formaction="/signup">
     <input class="w-full p-2 border border-gray-300 rounded" placeholder="Họ tên" type="text" name="name"/>
     <input class="w-full p-2 border border-gray-300 rounded" placeholder="Email" type="email" name="email"/>
     <input class="w-full p-2 border border-gray-300 rounded" placeholder="Số điện thoại" type="text" name="phoneNumber"/>
     <input class="w-full p-2 border border-gray-300 rounded" placeholder="Ngày sinh" type="date" name="birthday"/>
     <input class="w-full p-2 border border-gray-300 rounded" placeholder="Mật khẩu" type="password" name="password"/>
     <button class="w-full p-2 bg-black text-white rounded" type="submit" formmethod="post">
      Đăng ký
     </button>
    </form>
    <button class="w-full p-2 mt-4 border border-gray-300 rounded">
     Đăng nhập
    </button>
    <div class="flex items-center justify-center mt-4">
     <span class="text-gray-500">
      Hoặc
     </span>
    </div>
    <div class="flex justify-center space-x-4 mt-4">
     <button class="p-2 border border-gray-300 rounded-full">
      <i class="fab fa-google text-xl">
      </i>
     </button>
     <button class="p-2 border border-gray-300 rounded-full">
      <i class="fab fa-facebook text-xl">
      </i>
     </button>
    </div>
   </div>
  </main>
  <footer class="bg-black text-white mt-10 p-8">
   <div class="flex justify-between">
    <div>
     <img alt="Logo" class="h-10 mb-4" height="50" src="https://storage.googleapis.com/a1aa/image/leEpelTEVultEUtefSwAlMDoePUJACtvwrG0iYheBeB6zeSnTA.jpg" width="50"/>
     <p>
      © 2024 Shiko
     </p>
    </div>
    <div class="space-y-2">
     <h3 class="font-bold">
      Info
     </h3>
     <a class="block" href="#">
      Find a store
     </a>
     <a class="block" href="#">
      Discount
     </a>
     <a class="block" href="#">
      Gift
     </a>
     <a class="block" href="#">
      Feedback
     </a>
     <a class="block" href="#">
      Become a member
     </a>
    </div>
    <div class="space-y-2">
     <h3 class="font-bold">
      Shop
     </h3>
     <a class="block" href="#">
      Men
     </a>
     <a class="block" href="#">
      Women
     </a>
     <a class="block" href="#">
      Kids
     </a>
     <a class="block" href="#">
      Collections
     </a>
     <a class="block" href="#">
      Contacts
     </a>
    </div>
    <div class="space-y-2">
     <h3 class="font-bold">
      About
     </h3>
     <a class="block" href="#">
      News
     </a>
     <a class="block" href="#">
      Careers
     </a>
    </div>
    <div class="flex space-x-4">
     <a class="text-white" href="#">
      <i class="fab fa-facebook-f">
      </i>
     </a>
     <a class="text-white" href="#">
      <i class="fab fa-twitter">
      </i>
     </a>
     <a class="text-white" href="#">
      <i class="fab fa-instagram">
      </i>
     </a>
     <a class="text-white" href="#">
      <i class="fab fa-youtube">
      </i>
     </a>
    </div>
   </div>
   <div class="mt-4">
    <a class="text-gray-500" href="#">
     Privacy &amp; Cookie Policy
    </a>
   </div>
  </footer>
 </body>
</html>