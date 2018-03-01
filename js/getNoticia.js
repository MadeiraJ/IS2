var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

$(document).ready(function () {
    $.ajax({
        url: `/handlers/HandlerNoticias.ashx`,
        type: "POST",
        data: {noticia : getUrlParameter('noticia')},
        dataType: "json",
        success: function (noticia) {
            if(!noticia)
                window.location.href = "404.html";
            else {
                $(document.body).addClass(noticia.tipo);
                $(".tituloZonaConteudo .destaquesTitulo").append(noticia.titulo);
                $(".tituloZonaConteudo .detalhe .autor").append(`Autor: <br>${noticia.autor}`);
                $(".tituloZonaConteudo .detalhe .data").append(`Publicado em<br>${noticia.data}`);
                $(".tituloZonaConteudo .imagemCapa").append(`<img src="${noticia.imagemCapa}">`);
                $(".conteudo").append(noticia.texto);

                noticiasRelacionadas = JSON.parse(noticia.noticiasRelacionadas)
                for (var i = 0; i < noticiasRelacionadas.length; i++) {
                    var noticiaR = noticiasRelacionadas[i];
                    noticiaR = JSON.parse(noticiaR);
                    addNoticiasRelacionadas(noticiaR.imagemCapa, noticiaR.titulo, noticiaR.resumo, noticiaR.numeroNoticia);
                }
                addClear(".noticiasRelacionadas");
            } //else
        }, //success
        error: function (args) {
            window.location.href = "404.html";
        } //error
    })
});

function addNoticiasRelacionadas(imagem, titulo, texto, url) {
    var bloco =
            `<a href="noticia.html?noticia=${url}">
                <div class="bloco-1 hvr-grow">
                    <img src="${imagem}">
                    <div class="zonaTexto">
                        <p class="tituloArtigo">${titulo}</p>
                        <p class="textoNoticia">${texto}</p>
                    </div>
                </div>
            </a>`;
    $(".noticiasRelacionadas").append(bloco);
}

function addClear(classeCss) {
    $(classeCss).append('<div class="clear"></div>');
}