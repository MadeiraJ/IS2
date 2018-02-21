var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        } //if
    } //for
}; //getUrlParameter

$(document).ready(function () {
    $.ajax({
        url: `/handlers/HandlerArtigos.ashx`,
        type: "POST",
        data: {artigo : getUrlParameter('artigo')},
        dataType: "json",
        success: function (artigo) {
            $(document.body).addClass(artigo.tipo);
            $(".tituloZonaConteudo .destaquesTitulo").append(artigo.titulo);
            $(".tituloZonaConteudo .detalhe .autor").append(`Palavras de<br>${artigo.autor}`);
            $(".tituloZonaConteudo .detalhe .data").append(`Publicado em<br>${artigo.data}`);
            $(".tituloZonaConteudo .imagemCapa").append(`<img src="${artigo.imagemCapa}">`);
            $(".conteudo").append(artigo.texto);

            artigosRelacionados = JSON.parse(artigo.artigosRelacionados)
            for (var i = 0; i < artigosRelacionados.length; i++) {
                var artigoR = artigosRelacionados[i];
                artigoR = JSON.parse(artigoR);
                addArtigoRelacionado(artigoR.imagemCapa, artigoR.titulo, artigoR.resumo, artigoR.numeroArtigo);
            } //for
            addClear(".outrosArtigos");
        } //success
    }) //ajax
}); //document

function addArtigoRelacionado(imagem, titulo, texto, url) {
    var bloco =
            `<a href="artigo.html?artigo=${url}">
                <div class="bloco-1 post hvr-grow">
                    <img src="${imagem}">
                    <div class="zonaTexto">
                        <p class="tituloArtigo">${titulo}</p>
                        <p class="textoArtigo">${texto}</p>
                    </div>
                </div>
            </a>`;
    $(".outrosArtigos").append(bloco);
} //addArtigoRelacionado

function addClear(classeCss) {
    $(classeCss).append('<div class="clear"></div>');
} //addClear