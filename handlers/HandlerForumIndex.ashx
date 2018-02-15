<%@ WebHandler Language="C#" Class="GenericHandler1" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class GenericHandler1 : IHttpHandler {

    public void ProcessRequest(HttpContext context) {
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                getListaTopicos(context);
                break;
            case "2":
                getListaTopicosPorPesquisa(context);
                break;
        } //switch
    } //ProcessRequest


    /////////////////////////LISTA DE TOPICOS/////////////////////////
    public void getListaTopicos(HttpContext context) {
        String json = "";
        var listaDeTopicos = new List<String>();
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a 10 topicos de um tópico em particular, ou de todos os temas caso nenhum tema seja passado, ordenados pela data (de forma decrescente), de acordo com a página atual

        //Valores a serem apagados
        for(int i = 0; i < 10; i++)
            listaDeTopicos.Add(
                serializer.Serialize(
                    new { tema = "ALIMENTACAO", numeroRespostas = "2", pergunta = "Faz mal comer muitos ovos diariamente?", data = "12 de Janeiro às 12:45", estado = "Ativo" }
            ));

        var tema = context.Request.Form["classe"];
        tema = tema == null? null : tema.ToString();
        switch (tema)
        {
            //fazer a query de acordo com o tema, de forma a a ir buscar todos os topicos ordenados pela data (de forma decrescente)
            case "ALIMENTACAO":
                break;
            case "SEXUALIDADE":
                break;
            case "CONSUMOS":
                break;
            default:
                break;
        } //switch

        /*listaDeTopicos.Add(
            serializer.Serialize(
                new { tema = "CONSUMOS", numeroRespostas = "2", pergunta = "O que é ser um Vieira?", data = "12 de Janeiro às 12:45", estado = "Fechado" }
        ));

        listaDeTopicos.Add(
            serializer.Serialize(
                new { tema = "SEXUALIDADE", numeroRespostas = "2", pergunta = "Porque é que as hormonas andam aos “saltos”?", data = "12 de Janeiro às 12:45", estado = "Ativo" }
        ));

        listaDeTopicos.Add(
            serializer.Serialize(
                new { tema = "ALIMENTACAO", numeroRespostas = "2", pergunta = "Qual a quantidade de água deve ser ingerida, diariamente, por um adulto?", data = "12 de Janeiro às 12:45", estado = "Ativo" }
        ));

        listaDeTopicos.Add(
            serializer.Serialize(
                new { tema = "CONSUMOS", numeroRespostas = "2", pergunta = "O que é síndrome de abstinência?", data = "12 de Janeiro às 12:45", estado = "Fechado" }
        ));

        listaDeTopicos.Add(
            serializer.Serialize(
                new { tema = "SEXUALIDADE", numeroRespostas = "2", pergunta = "Ser lésbica ou gay é normal?", data = "12 de Janeiro às 12:45", estado = "Fechado" }
        ));*/

        json = serializer.Serialize(listaDeTopicos);


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getListaTopicos

    /////////////////////////LISTA TOPICOS POR TEMA/////////////////////////
    public void getListaTopicosPorTema(HttpContext context)
    {
        String json = "";
        var listaDeTopicosPorTema = new List<String>();
        var serializer = new JavaScriptSerializer();

        String tema = context.Request.Form["classe"].ToString();
        switch (tema)
        {
            //fazer a query de acordo com o tema, de forma a a ir buscar todos os topicos ordenados pela data (de forma decrescente)
            case "ALIMENTACAO":
                break;
            case "SEXUALIDADE":
                break;
            case "CONSUMOS":
                break;
        } //switch
        //Valores a serem apagados 
        listaDeTopicosPorTema.Add(
            serializer.Serialize(
                new {numeroRespostas = 2, pergunta = "Ser lésbica ou gay é normal?", data = "12 de Janeiro às 12:45", estado = "Fechado" }
        ));

        listaDeTopicosPorTema.Add(
            serializer.Serialize(
                new {numeroRespostas = 2, pergunta = "Qual a quantidade de água deve ser ingerida, diariamente, por um adulto?", data = "12 de Janeiro às 12:45", estado = "Ativo" }
        ));

        listaDeTopicosPorTema.Add(
            serializer.Serialize(
                new {numeroRespostas = 2, pergunta = "O que é síndrome de abstinência?", data = "12 de Janeiro às 12:45", estado = "Fechado" }
        ));

        json = serializer.Serialize(listaDeTopicosPorTema);


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getListaTopicosPorTema

    /////////////////////////LISTA TOPICOS POR PESQUISA/////////////////////////
    public void getListaTopicosPorPesquisa(HttpContext context)
    {
        /*String json = "";
        var listaDeVideos = new List<String>();
        var serializer = new JavaScriptSerializer();

        String tema = context.Request.Form["classe"].ToString();
        //Fazer aqui a query à respetiva tabela, de forma a conseguir ter os videos do tema
        switch (tema)
        {
            case "ALIMENTACAO":
                break;
            case "SEXUALIDADE":
                break;
            case "CONSUMOS":
                break;
        } //switch

        //Valores a serem apagados
        listaDeVideos.Add(
            serializer.Serialize(
                new { link = @"https://www.youtube.com/watch?v=0dVa81ecacE&list=PLrDezo9S25Je5OnmKCXCy_GPYUDQtj3dS", titulo = "Man never hot", texto = "The thing goes skraaaaa" }
        ));

        listaDeVideos.Add(
            serializer.Serialize(
                new { link = @"https://www.youtube.com/watch?v=3M_5oYU-IsU&list=PLJQeCC1As9Poqoy_3R13mI1ReVD-P-bqt", titulo = "Sociedade do mal", texto = "MAL" }
        ));
        json = serializer.Serialize(listaDeVideos);


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);*/
    } //getListaTopicosPorPesquisa

    public bool IsReusable {
        get {
            return false;
        }
    }
}