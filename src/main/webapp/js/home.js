document.querySelector('.search-btn').addEventListener('click', function (event) {
	const input = this.previousElementSibling; // Truy xuất ô input

	if (input.value.trim() === '') {
		// Nếu input trống, toggle class và focus vào ô input
		event.preventDefault(); // Ngăn không cho submit form
		this.parentElement.classList.toggle('open');
		input.focus();
	}
	// Nếu input có giá trị, form sẽ được submit tự động
});

const track = document.querySelector('.carousel-track');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');
const itemWidth = 260 + 10; // Độ rộng mỗi item + khoảng cách

let currentPosition = 0;

// Xử lý sự kiện cho nút Next
nextBtn.addEventListener('click', () => {
	const maxScroll = -(track.scrollWidth - track.parentElement.offsetWidth); // Giới hạn cuộn

	if (currentPosition > maxScroll) {
		currentPosition -= itemWidth;
		track.style.transform = `translateX(${currentPosition}px)`;
	}
});

// Xử lý sự kiện cho nút Prev
prevBtn.addEventListener('click', () => {
	if (currentPosition < 0) {
		currentPosition += itemWidth;
		track.style.transform = `translateX(${currentPosition}px)`;
	}
});
