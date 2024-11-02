<nav class="navbar navbar-expand-lg bg-light sticky-top">
	<div class="container">
		<img src="image/logo/Shiko_Logo_Black.png" alt="Logo" width="45"
			class="navbar-brand mx-5">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a href="/home" class="text-dark nav-link">HOME</a>
				</li>
				<li class="nav-item"><a href="/product" class="text-dark nav-link">PRODUCTS</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-dark" href="#" role="button"
					data-bs-toggle="dropdown" data-bs-target="#cateMenu" aria-expanded="false"> CATEGORIES </a>
					<ul class="dropdown-menu border border-0 rounded-0 bg-light" id="cateMenu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
				<li class="nav-item"><a href="#footer" class="text-dark nav-link">CONTACT</a>
				</li>
				<li class="nav-item"><a class="text-dark nav-link">ACCOUNT</a>
				</li>
			</ul>
			<div class="d-flex align-items-center gap-5">
				<form action="/search" class="search-box" role="search" method="post">
					<input type="text" class="search-input" name="search" />
					<button class="search-btn">
						<svg xmlns="http://www.w3.org/2000/svg" height="20" width="20"
							viewBox="0 0 512 512">
                                <path fill="#ffffff"
								d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
                            </svg>
					</button>
				</form>
				<div class="dropdown-center d-flex alignment-item-center">
					<button type="button" class="dropdown-toggle border-0 bg-light" data-bs-toggle="dropdown" data-bs-target="#userMenu" aria-expanded="false">
					<svg xmlns="http://www.w3.org/2000/svg" height="20" width="17.5" viewBox="0 0 448 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#000000" d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z"/></svg>
				</button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="/signin">Signin</a></li>
				    <li><a class="dropdown-item" href="/profile">Profile</a></li>
				    <li><a class="dropdown-item" href="#">Something else here</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="#">Separated link</a></li>
				  </ul>
				</div>
				<a href="/cart"> <svg xmlns="http://www.w3.org/2000/svg" height="20"
						width="22.5" viewBox="0 0 576 512">
                            <path fill="#000000"
							d="M0 24C0 10.7 10.7 0 24 0L69.5 0c22 0 41.5 12.8 50.6 32l411 0c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3l-288.5 0 5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5L488 336c13.3 0 24 10.7 24 24s-10.7 24-24 24l-288.3 0c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5L24 48C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" />
                        </svg>
				</a>
			</div>
		</div>
	</div>
</nav>