$(document).ready(function () {
  var slideout = new Slideout({
    'panel': document.getElementsByClassName('main')[0],
    'menu': document.getElementsByClassName('menu-mobile')[0],
    'padding': 256,
    'tolerance': 70
  });


  document.querySelector('.botao-mobile').addEventListener('click', function() {
    slideout.toggle();
  });

  slideout.on('beforeopen', function () {
    $('.main')
      .css('filter','brightness(0.4)')
      .css('webkitFilter','brightness(0.4)')
      .css('mozFilter','brightness(0.4)')
      .css('oFilter','brightness(0.4)')
      .css('msFilter','brightness(0.4)');
  });

  slideout.on('beforeclose', function () {
    $('.main')
      .css('filter','none')
      .css('webkitFilter','none')
      .css('mozFilter','none')
      .css('oFilter','none')
      .css('msFilter','none');
  });

  var fixed = document.querySelector('.zonaMenu');

  slideout.on('translate', function(translated) {
    fixed.style.transform = 'translateX(' + translated + 'px)';
  });

  slideout.on('beforeopen', function () {
    fixed.style.transition = 'transform 300ms ease';
    fixed.style.transform = 'translateX(256px)';
  });

  slideout.on('beforeclose', function () {
    fixed.style.transition = 'transform 300ms ease';
    fixed.style.transform = 'translateX(0px)';
  });

  slideout.on('open', function () {
    fixed.style.transition = '';
  });

  slideout.on('close', function () {
    fixed.style.transition = '';
  });
});