var numeroDestaques = 0;
var numeroVideos = 0;

$(document).ready(function () {
    var classe = $('body').attr('class');

    if(classe.includes("alimentacao"))
        classe = "ALIMENTACAO";
    else if (classe.includes("sexualidade"))
        classe = "SEXUALIDADE";
    else if(classe.includes("consumos"))
        classe = "CONSUMOS";

    getDestaques(classe, 7);
    
    $.ajax({
        url: `/handlers/HandlerTemas.ashx?type=2`,
        type: "POST",
        data: {classe: classe},
        dataType: "json",
        success: function (artigoEmDestaque) {
            addArtigoEmDestaque(
                artigoEmDestaque.imagem,
                artigoEmDestaque.titulo,
                artigoEmDestaque.texto,
                artigoEmDestaque.url
            );
        }
    });

    getVideos(classe, 3);

    $.ajax({
        url: `/handlers/HandlerTemas.ashx?type=4`,
        type: "POST",
        data: { classe: classe },
        dataType: "json",
        success: function (listaDeDocumentos) {
            for (var i = 0; i < listaDeDocumentos.length; i++) {
                listaDeDocumentos[i] = JSON.parse(listaDeDocumentos[i]);
                addDocumento(
                    classe,
                    listaDeDocumentos[i].nome,
                    listaDeDocumentos[i].url
                );
            }
        }
    });

    $.ajax({
        url: `/handlers/HandlerTemas.ashx?type=5`,
        type: "POST",
        data: { classe: classe },
        dataType: "json",
        success: function (listaDeLinks) {
            for (var i = 0; i < listaDeLinks.length; i++) {
                listaDeLinks[i] = JSON.parse(listaDeLinks[i]);
                addLink(
                    classe,
                    listaDeLinks[i].nome,
                    listaDeLinks[i].url
                );
            }
        }
    });


    $(".conteudo .carregarMais").click(function () {
        var before = numeroDestaques;
        getDestaques(classe, 6);
        if(numeroDestaques == before)
            $(".conteudo .carregarMais").hide();
    });

    $("#zonaDeVideos .carregarMais").click(function () {
        var before = numeroVideos;
        getVideos(classe, 6);
        if(numeroVideos == before)
            $("#zonaDeVideos .carregarMais").hide();
    });
})

function addArtigoEmDestaque(imagem, titulo, texto, url) {
    var bloco =
            `<a href="${url}">
                <div class="wow fadeIn">
                    <div class="bloco-2 post hvr-grow">
                        <img src="${imagem}">
                        <div class="zonaTexto">
                            <p class="tituloArtigo">${titulo}</p>
                            <p class="textoArtigo">${texto}</p>
                        </div>
                    </div>
                </div>
            </a>`;
    $(".col1").after(bloco);
}

function addBlocoArtigo(i, imagem, titulo, texto, url, extra) {
    var inserirNaColuna = ".col1";
    if (i % 3 == 0)
        inserirNaColuna = ".col3";
    else if (i % 2 == 0)
        inserirNaColuna = ".col2";

    var bloco =
            `<a href="${url}">
                <div class="wow fadeIn">
                    <div class="bloco-1 post hvr-grow ${extra}">
                        <img src="${imagem}">
                        <div class="zonaTexto">
                            <p class="tituloArtigo">${titulo}</p>
                            <p class="textoArtigo">${texto}</p>
                        </div>
                    </div>
                </div>
            </a>`;

    $(inserirNaColuna).append(bloco);
}

function addBlocoSabiasQue(i, texto, extra) {
    var inserirNaColuna = ".col1";
    if (i % 3 == 0)
        inserirNaColuna = ".col3";
    else if (i % 2 == 0)
        inserirNaColuna = ".col2";

    var bloco =
            `<div class="wow fadeIn">
                <div class="bloco-1 sabiasQue ${extra}">
                    <p class="tituloArtigo">SABIAS QUE</p>
                    <p class="textoArtigo">${texto}</p>
                </div>
            </div>`;
    $(inserirNaColuna).append(bloco);
}

function addVideo(link, titulo, texto) {
    var video =
        `<a onclick="verVideo(this)" name="${link}">
        <div class="postVideo hvr-grow wow fadeIn">
            <iframe src="https://www.youtube.com/embed/${link.split('&list=')[0].split('watch?v=')[1]}" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
            <p class="titulo">${titulo}</p>
            <p class="texto">${texto}</p>
        </div>
    </a>`;
    $('.listaVideos').append(video);
}

function addLink(classe, nome, url) {
    var imagem = "imagens/link_" + classe.toLowerCase() + ".png";
    var link = `<a href="${url}" class="wow fadeIn"><p class="linkUteis hvr-overline-from-left"><img src="${imagem}">${nome}</p></a>
        <br>`;
    $('#zonaLinks').append(link);
}

function addDocumento(classe, nome, url) {
    var imagem = "imagens/pin_" + classe.toLowerCase() + ".png";
    var documento = `<a href="${url}" class="wow fadeIn"> <p class="documentos hvr-overline-from-left"><img src="${imagem}">${nome}</p></a>
            <br>`;
    $('#zonaDocumentos').append(documento);
}

function addClear(classeCss) {
    $(classeCss).append('<div class="clear"></div>');
}


function getDestaques(classe, x){
    $.ajax({
        url: `/handlers/HandlerTemas.ashx?type=1`,
        type: "POST",
        data: {
            classe: classe,
            numeroArtigosRecebidos : numeroDestaques,
            numeroDeArtigosPedidos : x
        },
        dataType: "json",
        success: function (listaDestaques) {
            for (var i = 0; i < listaDestaques.length; i++) {
                listaDestaques[i] = JSON.parse(listaDestaques[i]);
                var tipoBloco =  listaDestaques[i].tipo;
                if(tipoBloco == "ARTIGO"){
                    addBlocoArtigo(
                        i + 1,
                        listaDestaques[i].imagem,
                        listaDestaques[i].titulo,
                        listaDestaques[i].texto,
                        listaDestaques[i].url
                    );
                }

                else if(tipoBloco == "SABIAS-QUE"){
                    addBlocoSabiasQue(
                        i + 1,
                        listaDestaques[i].texto
                    );
                }
            }
            numeroDestaques += listaDestaques.length;
        }
    });
}

function getVideos(classe, x) {
    $.ajax({
        url: `/handlers/HandlerTemas.ashx?type=3`,
        type: "POST",
        data: {
            classe: classe,
            numeroVideosRecebidos : numeroVideos,
            numeroDeVideosPedidos : x
        },
        dataType: "json",
        success: function (listaDeVideos) {
            for (var i = 0; i < listaDeVideos.length; i++) {
                listaDeVideos[i] = JSON.parse(listaDeVideos[i]);
                addVideo(
                    listaDeVideos[i].link,
                    listaDeVideos[i].titulo,
                    listaDeVideos[i].texto
                );
            }
            addClear('.listaVideos');
        }
    });
}