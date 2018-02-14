$(document).ready(function () {

    $.ajax({
        url: `/handlers/HandlerDivulgacao.ashx?type=1`,
        type: "POST",
        /*data: { classe: classe },*/
        dataType: "json",
        success: function (noticias) {
            addNoticia(
                noticias.imagem,
                noticias.data,
                noticias.titulo,
                noticias.texto,
                noticias.url
            );
        }
    });

    $.ajax({
        url: `/handlers/HandlerDivulgacao.ashx?type=2`,
        type: "POST",
        /*data: { classe: classe },*/
        dataType: "json",
        success: function (eventos) {
            addEvento(
               eventos.proximo,
               eventos.data,
               eventos.horas,
               eventos.local,
               eventos.titulo,
               eventos.descricao,
               eventos.imagem
            );
        }
    });
})
    function addNoticia(imagem, data, titulo, texto, url) {
        var inserirNaColuna = ".contentorNoticia";

        var noticia =
                ` <div class="contentorNoticia" onclick="window.location='${url}';">
                 <div class ="imagemNoticia"  style="background-image: url('${imagem}');"></div>
                    <div class ="zonaTextoNoticia">
                        <p class ="postadoNoticia">Postado a ${data}</p>
                        <p class ="tituloNoticia">${titulo}</p>
                        <p class ="textoNoticia">${texto}</p>
                     </div>
                         <div class ="clear"></div>
                </div>`;

        $(inserirNaColuna).append(noticia);
    }

    function addEvento(proximo, data, horas, local, titulo, descricao, imagem) {
        var inserirNaColuna = ".contentorEvento";

        var evento =
                `<div class="zonaTextoEvento">
                    <p class ="proximoEvento">${proximo}</p>
                    <p class ="dataEvento">${data}</p>
                    <p class ="horasEvento">${horas}</p>
                    <p class ="localEvento">${local}</p>
                    <p class ="tituloEvento">${titulo}</p>
                    <p class ="descricaoEvento">${descricao}</p>
                </div>
                <div class ="imagemEventos" style="background-image: url('${imagem}');></div>
                         <div class ="clear"></div>`;


        $(inserirNaColuna).append(evento);
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
