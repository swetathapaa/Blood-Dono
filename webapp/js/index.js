
document.querySelector(".msg").classList.add("hide")

function submit(){
    document.querySelector(".msg").classList.remove("hide")
    document.querySelector(".msg").classList.add("show")
}
function closeMsg(){
    document.querySelector(".msg").classList.remove("show")
    document.querySelector(".msg").classList.add("hide")
}

// Slider

const slides = document.querySelectorAll(".slides")
let slideIndex = 0

showSlide(slideIndex)

function showSlide(I){
    for (let i = 0; i < slides.length; i++){
        slides[i].classList.remove("showSlide")
    }
    slides[I].classList.add("showSlide")
}
function nextSlide(){
    slideIndex++
    if (slideIndex >= slides.length){
        slideIndex = 0
    }
    showSlide(slideIndex)
}
function prevSlide(){
    slideIndex--
    if (slideIndex < 0){
        slideIndex = slides.length - 1
    }
    showSlide(slideIndex)
}