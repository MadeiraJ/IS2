/**
 * Created by joão Madeira on 02/01/2018.
 */
window.addEventListener("load",montarDefinicoes,false);
//window.addEventListener("load",init,false);

var aLetra;
var oConteudo;

var letraAtual;
var conteudoAtual;

var idLetra;
var idAbecedario;

var ativo = "ativo";

function init(){
    idAbecedario = document.querySelector("#abecedario");
    letraAtual = document.querySelector("#a");
    conteudoAtual = document.querySelector("#lA");

    letraAtual.setAttribute("class","letra "+ativo);
    conteudoAtual.style.display = "block";

    idAbecedario.addEventListener("click",mudarConteudo,false);
}

function montarDefinicoes() {
    var tema = document.body.className.split(" ")[1];
    var qualFicheiro;
    if (tema == "alimentacao")
        qualFicheiro = "../IS2/xml/glossarioA.xml";
    else if (tema == "consumos")
        qualFicheiro = "../IS2/xml/glossarioC.xml";
    else if (tema == "sexualidade")
        qualFicheiro = "../IS2/xml/glossarioS.xml";

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            myFunction(this);
        }
    };
    xhttp.open("GET", qualFicheiro, true);
    xhttp.send();
}

function myFunction(xml) {
    var xmlDoc = xml.responseXML;
    var zonaDefi = document.querySelector("#zonaDefi");
    var letras = xmlDoc.getElementsByTagName("letra");

    for (var i = 0; i <= letras.length - 1; i++){
        var divLetra = document.createElement("div");
            divLetra.setAttribute("id", "l"+(letras[i].getAttribute('id')).toUpperCase());
            divLetra.setAttribute("style", "display: none");
            divLetra.setAttribute("class", "definicoes");
            var qualLetra = document.createElement("h1");
            qualLetra.innerHTML = letras[i].getAttribute('id');
            divLetra.appendChild(qualLetra);
            if(letras[i].childNodes.length > 1){
                var conteLetra = letras[i].childNodes;
                for (var j = 0; j <= conteLetra.length - 1; j++) {
                    if (conteLetra[j].hasChildNodes()) {
                        var definicao = document.createElement("div");
                        definicao.setAttribute("class", "definicao");

                        var titulo = document.createElement("h1");
                        titulo.innerHTML = conteLetra[j].childNodes[1].innerHTML;
                        definicao.appendChild(titulo);

                        var conteudo = document.createElement("p");
                        conteudo.innerHTML = conteLetra[j].childNodes[3].innerHTML;
                        definicao.appendChild(conteudo);

                        divLetra.appendChild(definicao);
                    }
                }
            }
            var clear = document.createElement("div");
            clear.setAttribute("class", "clear");
            divLetra.appendChild(clear);
            zonaDefi.appendChild(divLetra);
    }
    init();
}


function mudarConteudo(e) {
    var oClicado = e.target;
    idLetra = oClicado.id;
    if(idLetra != "abecedario")
        contCorresp();

}

function contCorresp(){
    aLetra = document.querySelector("#"+idLetra);
    oConteudo = document.querySelector("#l"+idLetra.toUpperCase());

    letraAtual.setAttribute("class","letra");
    aLetra.setAttribute("class","letra "+ativo);

    conteudoAtual.style.display = "none";
    oConteudo.style.display = "block";

    letraAtual = aLetra;
    conteudoAtual = oConteudo;
}