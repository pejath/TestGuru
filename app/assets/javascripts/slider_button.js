
window.addEventListener('load', () => {
    window.onload = function() {
        var buttons = document.getElementsByClassName('my-button');
        for (var i = 0; i < buttons.length; i++) {
            buttons[i].addEventListener('click', function() {
                var current = document.getElementsByClassName('active');
                current[0].className = current[0].className.replace('active-button', '');
                this.className += 'active-button';
            });
        }
    };

    var myCarousel = document.querySelector('#carouselExampleControls')
    var carousel = new bootstrap.Carousel(myCarousel)

    myCarousel.addEventListener('slid.bs.carousel', function (event) {
        var currentIndex = Array.from(myCarousel.querySelectorAll('.carousel-item')).indexOf(event.relatedTarget);
        var buttons = document.getElementsByClassName('my-button');
        for (var i = 0; i < buttons.length; i++) {
            buttons[i].classList.remove('active-button');
            if (buttons[i].getAttribute('data-bs-slide-to') == currentIndex) {
                buttons[i].classList.add('active-button');
            }
        }
    });

})
