$(document).ready(function () {
    var listaResultados = [
            {
                tipo : "ARTIGO",
                imagem : "imagens/alimentacao_1.png",
                video : null,
                titulo : "Por favor funciona",
                texto : "Isto é um texto",
                url : "artigo_exemplo.html"
            },
            {
                tipo : "SABIAS-QUE",
                texto : "Se isto funcionar eu mando-me de uma janela",
            }
    ];
    var artigoEmDestaque = {
        imagem : "imagens/alimentacao_1.png",
        video : null,
        titulo : "Por favor funcemina",
        texto : "Se isto funcionar eu mando-me de 2 janelas",
        url : "artigo_exemplo.html"
    };

    /*$.ajax({
        url: "/api/handler/getDestaques?type=1",
        type: "POST",
        dataType: "json",
        success: function (result) {
            listaResultados = result;
        }
    });
    $.ajax({
        url: "/api/handler/getArtigoEmDestaque?type=1",
        type: "POST",
        dataType: "json",
        success: function (result) {
            artigoEmDestaque = result;
        }
    });*/

    addArtigoEmDestaque(
        artigoEmDestaque.imagem,
        artigoEmDestaque.titulo,
        artigoEmDestaque.texto,
        artigoEmDestaque.url
    );

    for (var i = 0; i < listaResultados.length; i++) {
        var tipoBloco =  listaResultados[i].tipo;
        if(tipoBloco == "ARTIGO"){
            addBlocoArtigo(
                i + 1,
                listaResultados[i].imagem,
                listaResultados[i].titulo,
                listaResultados[i].texto,
                listaResultados[i].url,
            );
        }

        else if(tipoBloco == "SABIAS-QUE"){
            addBlocoSabiasQue(
                i + 1,
                listaResultados[i].texto,
            );
        }
    }
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

function addBlocoArtigo(i, imagem, titulo, texto, url) {
    var inserirNaColuna = ".col1";
    if (i % 3 == 0)
        inserirNaColuna = ".col3";
    else if (i % 2 == 0)
        inserirNaColuna = ".col2";

    var bloco =
            `<a href="${url}">
                <div class="wow fadeIn">
                    <div class="bloco-1 post hvr-grow">
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

function addBlocoSabiasQue(i, texto) {
    var inserirNaColuna = ".col1";
    if (i % 3 == 0)
        inserirNaColuna = ".col3";
    else if (i % 2 == 0)
        inserirNaColuna = ".col2";

    var bloco =
            `<div class="wow fadeIn">
                <div class="bloco-1 sabiasQue">
                    <p class="tituloArtigo">SABIAS QUE</p>
                    <p class="textoArtigo">${texto}</p>
                </div>
            </div>`;
    $(inserirNaColuna).append(bloco);
}