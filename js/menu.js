$(document).ready(function () {
  var indexColor;
  $('.navbar-mobile .botao-mobile').click(function () {

    var menu = $('.menu-mobile .topicosMenu');
    if (menu.is(":visible")){
      $('html').css({"overflow": "auto"});
      $('html').css({"overflow": "initial"});
      menu.slideToggle("slow", function () {
        $('.index .zonaMenu').animate({backgroundColor: indexColor}, 'slow');
      });
    }

    else {
      indexColor = $('.index .zonaMenu').css("background-color");
      menu.slideToggle("slow", function () {});
      $('.index .zonaMenu').css("background-color", "rgba(6, 41, 64, 1)");
      $('html').css({"overflow": "hidden"});
    }
  });

  $('.menu-mobile button').click(function() {
    var menu = $('.menu-mobile .topicosMenu');
    $('html').css({"overflow": "auto"});
    $('html').css({"overflow": "initial"});
    menu.slideToggle("slow", function () {
      $('.index .zonaMenu').animate({backgroundColor: indexColor}, 'slow');
    });
  })
  $(window).scroll(function(){
    scrollTop = $(window).scrollTop();
      if (scrollTop >= 100)
        $('.index .zonaMenu').css("background-color", "rgba(6, 41, 64, 1)");
      else
        $('.index .zonaMenu').css("background-color", "rgba(6, 41, 64, " + (scrollTop/100) + ")");
    });
});