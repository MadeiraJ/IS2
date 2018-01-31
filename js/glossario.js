/**
 * Created by joão Madeira on 02/01/2018.
 */

window.addEventListener("load",init,false);

var aLetra;
var aSeta;
var oConteudo;

var letraAtual;
var conteudoAtual;
var setaAtual;

var idLetra;
var idAbecedario;

var ativo = "ativo";

function init(){
    idAbecedario = document.querySelector("#abecedario");
    letraAtual = document.querySelector("#a");
    conteudoAtual = document.querySelector("#lA");
    setaAtual = document.querySelector("#a_S");

    letraAtual.setAttribute("class","letra "+ativo);

    idAbecedario.addEventListener("click",mudarConteudo,false);
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
    aSeta = document.querySelector("#"+idLetra+"_S");

    letraAtual.setAttribute("class","letra");
    aLetra.setAttribute("class","letra "+ativo);

    conteudoAtual.style.visibility = "hidden";
    oConteudo.style.visibility = "visible";

    setaAtual.style.visibility = "hidden";
    aSeta.style.visibility = "visible";

    letraAtual = aLetra;
    conteudoAtual = oConteudo;
    setaAtual = aSeta;
}