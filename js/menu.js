$(document).ready(function () {
  var indexColor;
  $('.navbar-mobile .botao-mobile').click(function () {

    var menu = $('.menu-mobile .topicosMenu');
    if (menu.is(":visible")){
      //Fazer o menu desaparecer
      $(document.body).css({"overflow": "initial"});
      $('.menu-mobile .topicosMenu ul').slideToggle("slow", function () {
        $('.index .zonaMenu').animate({backgroundColor: indexColor}, 'slow');
        //$('.menu-mobile .topicosMenu').slideToggle("fast", function () {});
        $('.menu-mobile .topicosMenu').hide();
      });

      /*$('.menu-mobile .topicosMenu').slideToggle("slow", function () {
        $('.index .zonaMenu').animate({backgroundColor: indexColor}, 'slow');
        //$('.menu-mobile .topicosMenu').slideToggle("fast", function () {});
      });*/
        $('.menu-mobile .topicosMenu .menu-contentor').slideToggle("slow", function () {});
    }

    else {
      //Fazer o menu reaparecer
      indexColor = $('.index .zonaMenu').css("background-color");
      //$('.menu-mobile .topicosMenu').show();
      $('.menu-mobile .topicosMenu').slideToggle("slow", function () {
        $('.menu-mobile .topicosMenu .menu-contentor').slideToggle("slow", function () {});
      });

      $('.index .zonaMenu').css("background-color", "rgba(6, 41, 64, 1)");
      $(".menu-mobile .topicosMenu").css({"position": "absolute"}, {"overflow": "scroll"}, {"z-index": "10"});
      $(document.body).css({"overflow": "hidden"});
      indexColor = $('.index .zonaMenu').css("background-color");
      $('.menu-mobile .topicosMenu').slideToggle("slow", function () {
        //$('.menu-mobile .topicosMenu').slideToggle("fast", function () {});
      });
      $('.menu-mobile .topicosMenu .menu-contentor').slideToggle("slow", function () {
      $('.index .zonaMenu').css("background-color", "rgba(6, 41, 64, 1)");
      $(".menu-mobile .topicosMenu").css({"position": "absolute"}, {"overflow": "scroll"}, {"z-index": "10"});
      $(document.body).css({"overflow": "hidden"});
    });
  }
});

  $('.menu-mobile button').click(function() {
    var menu = $('.menu-mobile .topicosMenu');
    $(document.body).css({"overflow": "initial"});
    $('.menu-mobile .topicosMenu ul').slideToggle("slow", function () {
      $('.index .zonaMenu').animate({backgroundColor: indexColor}, 'slow');
      //$('.menu-mobile .topicosMenu').slideToggle("fast", function () {});
      $('.menu-mobile .topicosMenu').hide();
    });
    $(document.body).css({"overflow": "initial"});
  })
  $(window).scroll(function(){
    scrollTop = $(window).scrollTop();
      if (scrollTop >= 100)
        $('.index .zonaMenu').css("background-color", "rgba(6, 41, 64, 1)");
      else
        $('.index .zonaMenu').css("background-color", "rgba(6, 41, 64, " + (scrollTop/100) + ")");
    });
});
