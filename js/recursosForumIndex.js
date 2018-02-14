var temaPesquisa;
var todosTopico = [];
$(document).ready(function () {
    $.ajax({
        url: `/handlers/HandlerForumIndex.ashx?type=1`,
        type: "POST",
        /*data: { classe: classe },*/
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
            }
        }
    });

    $('.search_bar').keyup(function () {
        var texto = ($('.search_bar').val()).split(" ");
        $(".zona_topicos").empty();
        for (var i = 0; i < todosTopico.length; i++) {
            var e = true;
            for (var j = 0; j < texto.length; j++) {
                if (((todosTopico[i].pergunta).toUpperCase()).indexOf(texto[j].toUpperCase()) == -1) {
                    e = false;
                    break;
                }
            }
            if (e) {
                addBlocoTopicos(todosTopico[i].tema, todosTopico[i].numeroRespostas, todosTopico[i].pergunta, todosTopico[i].data, todosTopico[i].estado);
            }
        }
    });
})

$(document).on('click', '.filtroTema', function(){
    var classe = this.innerText;
    if (classe == "ALIMENTAÇÃO")
        classe = "ALIMENTACAO";
    else if (classe == "CONSUMOS NOCIVOS")
        classe = "CONSUMOS";
    temaPesquisa = classe;
    $(".zona_topicos").empty();

    $.ajax({
        url: `/handlers/HandlerForumIndex.ashx?type=2`,
        type: "POST",
        data: { classe: classe },
        dataType: "json",
        success: function (listaTopicosTema) {
            for (var i = 0; i < listaTopicosTema.length; i++) {
                listaTopicosTema[i] = JSON.parse(listaTopicosTema[i]);
                lTopicos[i] = listaTopicosTema[i].pergunta;
                addBlocoTopicos(
                    temaPesquisa,
                    listaTopicosTema[i].numeroRespostas,
                    listaTopicosTema[i].pergunta,
                    listaTopicosTema[i].data,
                    listaTopicosTema[i].estado
                );
            }
        }
    });
})

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
}

function addClear(classeCss) {
    $(classeCss).append('<div class="clear"></div>');
}

function verNomeTema(tema) {
    if (tema == "ALIMENTACAO") {
        return "ALIMENTAÇÃO";
    } else if (tema == "CONSUMOS") {
        return "CONSUMOS NOCIVOS";
    } else {
        return "SEXUALIDADE";
    }
}