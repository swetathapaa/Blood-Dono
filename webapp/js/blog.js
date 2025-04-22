// blog.js

document.addEventListener("DOMContentLoaded", () => {
  const slides = document.querySelectorAll(".slider .slide img");
  let currentSlide = 0;

  function showSlide(index) {
    slides.forEach((img, i) => {
      img.classList.remove("active");
      if (i === index) {
        img.classList.add("active");
      }
    });
  }

  function nextSlide() {
    currentSlide = (currentSlide + 1) % slides.length;
    showSlide(currentSlide);
  }

  // Initial display
  showSlide(currentSlide);

  // Auto slide every 3 seconds
  setInterval(nextSlide, 3000);
});
