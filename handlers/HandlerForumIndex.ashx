<%@ WebHandler Language="C#" Class="GenericHandler1" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class GenericHandler1 : IHttpHandler {

    public void ProcessRequest(HttpContext context) {
        context.Response.ContentType = "json";
        var x = context.Request;
        getListaTopicos(context);
    } //ProcessRequest


    /////////////////////////LISTA DE TOPICOS/////////////////////////
    public void getListaTopicos(HttpContext context) {
        String json = "";
        var listaDeTopicos = new List<String>();
        var serializer = new JavaScriptSerializer();
        
        //fazer a query de todos os topicos de ordenados pela data (de forma decrescente)

        //Valores a serem apagados
        for(int i = 0; i < 10; i++){
            listaDeTopicos.Add(
                serializer.Serialize(
                    new { tema = "ALIMENTACAO", numeroRespostas = "2", pergunta = "Faz mal comer muitos ovos diariamente?", data = "12 de Janeiro às 12:45", estado = "Ativo", id="2" }
            ));
            listaDeTopicos.Add(
                serializer.Serialize(
                    new { tema = "CONSUMOS", numeroRespostas = "2", pergunta = "O que é ser um Vieira?", data = "12 de Janeiro às 12:45", estado = "Fechado", id="2" }
            ));

            listaDeTopicos.Add(
                serializer.Serialize(
                    new { tema = "SEXUALIDADE", numeroRespostas = "2", pergunta = "Porque é que as hormonas andam aos “saltos”?", data = "12 de Janeiro às 12:45", estado = "Ativo", id="2" }
            ));

            listaDeTopicos.Add(
                serializer.Serialize(
                    new { tema = "ALIMENTACAO", numeroRespostas = "2", pergunta = "Qual a quantidade de água deve ser ingerida, diariamente, por um adulto?", data = "12 de Janeiro às 12:45", estado = "Ativo", id="2" }
            ));

            listaDeTopicos.Add(
                serializer.Serialize(
                    new { tema = "CONSUMOS", numeroRespostas = "2", pergunta = "O que é síndrome de abstinência?", data = "12 de Janeiro às 12:45", estado = "Fechado", id="2" }
            ));

            listaDeTopicos.Add(
                serializer.Serialize(
                    new { tema = "SEXUALIDADE", numeroRespostas = "2", pergunta = "Ser lésbica ou gay é normal?", data = "12 de Janeiro às 12:45", estado = "Fechado", id="2" }
            ));
        }

        json = serializer.Serialize(listaDeTopicos);
        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getListaTopicos


    public bool IsReusable {
        get {
            return false;
        }
    }
}