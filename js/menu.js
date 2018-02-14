$(document).ready(function () {
  var indexColor;
  $('.navbar-mobile .botao-mobile').click(function () {

    var menu = $('.menu-mobile .topicosMenu');
    if (menu.is(":visible")){
      $(document.body).css({"overflow": "auto"});
      $(document.body).css({"overflow": "initial"});
      menu.slideToggle("slow", function () {
        $('.index .zonaMenu').animate({backgroundColor: indexColor}, 'slow');
      });
    }

    else {
      indexColor = $('.index .zonaMenu').css("background-color");
      menu.slideToggle("slow", function () {});
      $('.index .zonaMenu').css("background-color", "rgba(6, 41, 64, 1)");
      $(document.body).css({"position": "fixed"});
      $(".zonaMenu").css({"position": "absolute"});
      $(".zonaMenu").css({"overflow": "scroll"});
    }
  });

  $('.menu-mobile button').click(function() {
    var menu = $('.menu-mobile .topicosMenu');
    $(document.body).css({"position": "initial"});
    $(document.body).css({"overflow": "initial"});
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
