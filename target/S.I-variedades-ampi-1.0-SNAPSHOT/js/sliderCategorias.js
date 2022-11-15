const sliderr = document.querySelector("#sliderr");
let sliderSectionn = document.querySelectorAll(".slider-sectionn");
let sliderSectionLastt = sliderSectionn[sliderSectionn.length - 1];

const btnleeftt = document.querySelector("#derecho-btn");
const btnrigghtt = document.querySelector("#izquierdo-btn");

sliderr.insertAdjacentElement('afterbegin', sliderSectionLastt);

function siguiente() {
    let sliderSectionFirstt = document.querySelectorAll(".slider-sectionn")[0];
    sliderr.style.marginLeft = "-200%";
    sliderr.style.transition = "all 0.5s";
    setTimeout(function () {
        sliderr.style.transition = "none";
        sliderr.insertAdjacentElement('beforeend', sliderSectionFirstt);
        sliderr.style.marginLeft = "-100%";
    }, 500);
}

function atras() {
    let sliderSectionnn = document.querySelectorAll(".slider-sectionn");
    let sliderSectionLastt = sliderSectionnn[sliderSectionnn.length - 1];
    sliderr.style.marginLeft = "0";
    sliderr.style.transition = "all 0.5s";
    setTimeout(function () {
        sliderr.style.transition = "none";
        sliderr.insertAdjacentElement('afterbegin', sliderSectionLastt);
        sliderr.style.marginLeft = "-100%";
    }, 500);
}

btnrigghtt.addEventListener('click', function () {
    siguiente();
});

btnleeftt.addEventListener('click', function () {
    atras();
});