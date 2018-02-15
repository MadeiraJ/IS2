var todosTopico = [];
var paginaAtual;
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? false : sParameterName[1];
        } //if
    } //for
}; //getUrlParameter

$(document).ready(function () {
    paginaAtual = getUrlParameter('pagina');
    paginaAtual = paginaAtual? parseInt(paginaAtual) : 1;
    getPagina(paginaAtual);

    $('.search_bar').keyup(function () {
        var texto = ($('.search_bar').val()).split(" ");
        $(".zona_topicos").empty();
        for (var i = 0; i < todosTopico.length; i++) {
            var e = true;
            for (var j = 0; j < texto.length; j++) {
                var pergunta = todosTopico[i].pergunta;
                pergunta = pergunta.toUpperCase();
                var palavraASerPesquisada = texto[j].toUpperCase();
                if (pergunta.indexOf(palavraASerPesquisada) == -1) {
                    e = false;
                    break;
                } //if
            } //for
            if (e) {
                addBlocoTopicos(
                    todosTopico[i].tema,
                    todosTopico[i].numeroRespostas,
                    todosTopico[i].pergunta,
                    todosTopico[i].data,
                    todosTopico[i].estado);
            } //if
        } //for
    }); //pesquisa keyup

    $('.filtroTema').click(function() {
        var classe = this.innerText;
        if (classe == "ALIMENTAÇÃO")
            classe = "ALIMENTACAO";
        else if (classe == "CONSUMOS NOCIVOS")
            classe = "CONSUMOS";

        $(".zona_topicos").empty();

        getPagina(paginaAtual, classe);
    }); //filtroTema
}); //document

function addBlocoTopicos(tema, numeroRespostas, pergunta, data, estado) {
    var bloco =
        `<div class="div_topico forum_${tema.toLowerCase()}">
            <div class ="tag">
                <img src="imagens/tag_forum.png">
                <spam class="filtroTema">${verNomeTema(tema)}</a>
            </div>
            <div class ="zonaNrRespostas">
                <div class ="simboloResposta">
                    <img src="imagens/chat_icon.png">
                </div>
                <span class ="topicoNrRespostas">${numeroRespostas} respostas</span>
            </div>
            <p class ="textoTopicos">${pergunta}</p>
            <div class ="zonaDiaHoraEstado">
                <spam class ="textoDiaHora">${data}</spam>
                <p class ="topico${estado}">&#9679; ${estado}</p>
                <div class ="clear"></div>
            </div>
        </div>`;
    $(".zona_topicos").append(bloco);
} //addBlocoTopicos

function addClear(classeCss) {
    $(classeCss).append('<div class="clear"></div>');
} //addClear

function verNomeTema(tema) {
    if (tema == "ALIMENTACAO") {
        return "ALIMENTAÇÃO";
    } else if (tema == "CONSUMOS") {
        return "CONSUMOS NOCIVOS";
    } else {
        return "SEXUALIDADE";
    }
} //verNomeTema

function getPagina(pagina, classe) {
    $.ajax({
        url: `/handlers/HandlerForumIndex.ashx?type=1`,
        type: "POST",
        data: {
            classe: classe,
            paginaAtual : pagina
        },
        dataType: "json",
        success: function (listaTopicos) {
            for (var i = 0; i < listaTopicos.length; i++) {
                listaTopicos[i] = JSON.parse(listaTopicos[i]);
                todosTopico.push(listaTopicos[i]);
                addBlocoTopicos(
                    listaTopicos[i].tema,
                    listaTopicos[i].numeroRespostas,
                    listaTopicos[i].pergunta,
                    listaTopicos[i].data,
                    listaTopicos[i].estado
                 );
            } //for
        } //success
    }); //ajax
} //getPagina