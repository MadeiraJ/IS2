$(document).ready(function () {
    $.ajax({
        url: `/handlers/HandlerDestaques.ashx?type=1`,
        type: "POST",
        /*data: { classe: classe },*/
        dataType: "json",
        success: function (listaDestaques) {
            for (var i = 0; i < listaDestaques.length; i++) {
                listaDestaques[i] = JSON.parse(listaDestaques[i]);
                var tipoBloco = listaDestaques[i].tipo;
                if (tipoBloco == "ARTIGO") {
                    addBlocoArtigo(
                        i + 1,
                        listaDestaques[i].tema,
                        listaDestaques[i].imagem,
                        listaDestaques[i].titulo,
                        listaDestaques[i].texto,
                        listaDestaques[i].url
                    );
                }

                else if (tipoBloco == "SABIAS-QUE") {
                    addBlocoSabiasQue(
                        i + 1,
                        listaDestaques[i].tema,
                        listaDestaques[i].imagem,
                        listaDestaques[i].texto
                    );
                }

                else if (tipoBloco == "VIDEO") {
                    addBlocoVideo(
                        i + 1,
                        listaDestaques[i].tema,
                        listaDestaques[i].link,
                        listaDestaques[i].titulo,
                        listaDestaques[i].texto
                    );
                }
            }
        }
    });

    $.ajax({
        url: `/handlers/HandlerDestaques.ashx?type=2`,
        type: "POST",
        /*data: { classe: classe },*/
        dataType: "json",
        success: function (artigoEmDestaque) {
            addArtigoEmDestaque(
                artigoEmDestaque.tema,
                artigoEmDestaque.imagem,
                artigoEmDestaque.titulo,
                artigoEmDestaque.texto,
                artigoEmDestaque.url
            );
        }
    });

    $.ajax({
        url: `/handlers/HandlerDestaques.ashx?type=3`,
        type: "POST",
        /*data: { classe: classe },*/
        dataType: "json",
        success: function (listaDeVideos) {
            for (var i = 0; i < listaDeVideos.length; i++) {
                listaDeVideos[i] = JSON.parse(listaDeVideos[i]);
                addVideo(
                    listaDeVideos[i].tema,
                    listaDeVideos[i].link,
                    listaDeVideos[i].titulo,
                    listaDeVideos[i].texto
                );
            }
            addClear('.listaVideos');
        }
    });
})
// ver cores
function addArtigoEmDestaque(tema, imagem, titulo, texto, url) {
    var bloco =
            `<a href="${url}">
                <div class ="${tema.toLowerCase()} bloco-2 card artigo wow fadeIn hvr-grow">
                    <img src="${imagem}">
                    <div class ="textoBloco">
                        <div class ="blocoTopo">                                             
                            <p class ="titulo">${titulo}</p>
                            <div class ="tag">
                                <img src="imagens/tag${tema.charAt(0).toUpperCase() + tema.substr(1).toLowerCase()}.png">
                                <a href="${tema.toLowerCase()}.html">${tema.toUpperCase()}</a>
                            </div>
                            <div class ="clear"></div>
                        </div>
                        <p class ="texto">${texto}</p>
                    </div>
                </div>
            </a>`;
    $(".col1").after(bloco);
}

function addBlocoArtigo(i, tema, imagem, titulo, texto, url) {
    var inserirNaColuna = ".col1";
    if (i % 3 == 0)
        inserirNaColuna = ".col3";
    else if (i % 2 == 0)
        inserirNaColuna = ".col2";

    var bloco =
            `<a href="${url}">
                <div class ="${tema.toLowerCase()} bloco-1 card artigo wow fadeIn hvr-grow">
                    <img src="${imagem}">
                    <div class ="textoBloco">
                        <div class ="blocoTopo">
                            <p class ="titulo">${titulo}</p>
                            <div class ="tag">
                                <img src="imagens/tag${tema.charAt(0).toUpperCase() +tema.substr(1).toLowerCase()}.png">
                                <a href="${tema.toLowerCase()}.html">${tema.toUpperCase()}</a>
                            </div>
                            <div class ="clear"></div>
                        </div>
                        <p class ="texto">${texto}</p>
                    </div>
                </div>
            </a>`;

    $(inserirNaColuna).append(bloco);
}

function addBlocoSabiasQue(i, tema, imagem, texto) {
    var inserirNaColuna = ".col1";
    if (i % 3 == 0)
        inserirNaColuna = ".col3";
    else if (i % 2 == 0)
        inserirNaColuna = ".col2";

    var bloco =
            `<div class="${tema.toLowerCase()} bloco-1 card sabias-que wow fadeIn">
                <div class ="textoBloco">
                    <div class ="blocoTopo">
                        <p class ="titulo">SABIAS QUE</p>
                        <div class ="tag">
                            <img src="imagens/tag${tema.charAt(0).toUpperCase() +tema.substr(1).toLowerCase()}.png">
                            <a href="${tema.toLowerCase()}.html">${tema.toUpperCase()}</a>
                        </div>
                        <div class ="clear"></div>
                    </div>
                    <p class ="texto">${texto}</p>
                </div>
            </div>`;
    $(inserirNaColuna).append(bloco);
}

function addBlocoVideo(i, tema, link, titulo, texto) {
    var inserirNaColuna = ".col1";
    if (i % 3 == 0)
        inserirNaColuna = ".col3";
    else if (i % 2 == 0)
        inserirNaColuna = ".col2";

    var bloco =
            `<a href="#">
                <div class ="${tema.toLowerCase()} bloco-1 card video wow fadeIn hvr-grow">
                    <iframe src="${link}" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
                    <div class ="textoBloco">
                        <div class ="blocoTopo">
                            <p class ="titulo">VIDEOS</p>
                            <div class ="tag">
                                <img src="imagens/tag${tema.charAt(0).toUpperCase() +tema.substr(1).toLowerCase()}.png">
                                <a href="${tema.toLowerCase()}.html">${tema.toUpperCase()}</a>
                            </div>
                            <div class ="clear"></div>
                        </div>
                        <p class ="texto">${texto}</p>
                    </div>
                </div>
             </a>`;
    $(inserirNaColuna).append(bloco);
}

function addVideo(tema, link, titulo, texto) {
    var video =
            `<a href="#">
                <div class ="${tema.toLowerCase()} video card wow fadeIn hvr-grow">
                    <iframe src="${link}" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
                    <div class ="textoBloco">
                        <div class ="blocoTopo">
                            <p class ="titulo">VIDEOS</p>
                            <div class ="tag">
                                <img src="imagens/tag${tema.charAt(0).toUpperCase() + tema.substr(1).toLowerCase()}.png">
                                <a href="${tema.toLowerCase()}.html">${tema.toUpperCase()}</a>
                            </div>
                            <div class ="clear"></div>
                        </div>
                        <p class ="texto">${texto}</p>
                    </div>
                </div>
             </a>`;
    $('.listaVideos').append(video);
}

function addClear(classeCss) {
    $(classeCss).append('<div class="clear"></div>');
}