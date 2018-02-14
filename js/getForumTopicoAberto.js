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
        }
    });

   contadorRespostas();
})

function contadorRespostas() {

    var numeroRespostas = document.getElementsByClassName('div_Respostas');
    
    var inserirNaColuna = ".zonaNrRespostasAberto";

    var nrRespostas =
            `<span class="topicoNrRespostasAberto">${numeroRespostas.length}  respostas</span>`;


    $(inserirNaColuna).append(nrRespostas);
}

    function addResposta(data,texto,quemRespondeu) {
        var inserirNaColuna = ".div_Respostas";

        var resposta =
                `<p class ="dataResposta">Postado a ${data}</p>
                     <p class ="textoResposta">${texto}</p>
                         <div class ="clear"></div>
                     <p class ="quemRespondeu">Respondido por ${quemRespondeu}</p>
                     <div class ="clear"></div>`;

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
