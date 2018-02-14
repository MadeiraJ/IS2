$(document).ready(function () {

   

    $.ajax({
        url: `/handlers/HandlerForumTopicoAberto.ashx?type=1`,
        type: "POST",
        /*data: { classe: classe },*/
        dataType: "json",
        success: function (respostas) {
            addResposta(
              respostas.data,
              respostas.texto,
              respostas.quemRespondeu
            );
            contadorRespostas();
        }
    });
    
    $.ajax({
        url: `/handlers/HandlerForumTopicoAberto.ashx?type=2`,
        type: "POST",
        /*data: { classe: classe },*/
        dataType: "json",
        success: function (descricao) {
            addDescricao(
              descricao.texto,
              descricao.data
            );
        }

    });

    $.ajax({
        url: `/handlers/HandlerForumTopicoAberto.ashx?type=3`,
        type: "POST",
        /*data: { classe: classe },*/
        dataType: "json",
        success: function (titulo) {
            addTitulo(
              titulo.texto
            );
        }
    });

  
})

function addTitulo(texto) {
    var inserirNaColuna = ".zonaTitulo";

    var titulo =
            ` <p class="tituloTopico">${texto}</p>`;

    $(inserirNaColuna).append(titulo);
}
  
function addDescricao(texto,data) {
    var inserirNaColuna = ".div_descricao";

    var descricao =
            `<p class ="textoResposta" style="padding-top: 5%;  padding-bottom: 0;">${texto}</p>
                <div class="clear"></div>
                <p class ="dataDescricao">${data}</p>
                <div class="clear"></div>`;

    $(inserirNaColuna).append(descricao);
}

function contadorRespostas() {

    var numeroRespostas = document.getElementsByClassName('div_Respostas');
    
    var inserirNaColuna = ".zonaNrRespostasAberto";

    var nrRespostas =
            `<span class="topicoNrRespostasAberto">${numeroRespostas.length}  respostas</span>`;


    $(inserirNaColuna).append(nrRespostas);
}

    function addResposta(data,texto,quemRespondeu) {
        var inserirNaColuna = ".zonaRespostas";

        var resposta =
                ` <div class="div_Respostas" style="margin-top: 8%">
                <p class ="dataResposta">Postado a ${data}</p>
                     <p class ="textoResposta">${texto}</p>
                         <div class ="clear"></div>
                     <p class ="quemRespondeu">Respondido por ${quemRespondeu}</p>
                     <div class ="clear"></div>
                     </div>`;

        $(inserirNaColuna).append(resposta);
    }
    
    
    

    /*function addPublicacao(proximo, data, horas, local, titulo, descricao, imagem) {
        var inserirNaColuna = ".contentorPublicacao";

        var publicacao =
                `<div class="zonaTextoEvento">
                    <p class ="proximoEvento">${proximo}</p>
                    <p class ="dataEvento">${data}</p>
                    <p class ="horasEvento">${horas}</p>
                    <p class ="localEvento">${local}</p>
                    <p class ="tituloEvento">${titulo}</p>
                    <p class ="descricaoEvento">${descricao}</p>
                </div>
                <div class ="imagemEventos" style="background-image: url(${imagem});></div>
                         <div class ="clear"></div>`;

        $(inserirNaColuna).append(publicacao);
    }*/
    function addClear(classeCss) {
        $(classeCss).append('<div class="clear"></div>');
    }
