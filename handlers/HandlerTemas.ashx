<%@ WebHandler Language="C#" Class="TemasHandler" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class TemasHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context) {
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                getDestaques(context);
                break;
            case "2":
                getArtigoEmDestaque(context);
                break;
            case "3":
                getVideos(context);
                break;
            case "4":
                getDocumentos(context);
                break;
            case "5":
                getLinks(context);
                break;
        }
    } //ProcessRequest



    /////////////////////////DESTAQUES/////////////////////////
    public void getDestaques(HttpContext context) {
        String json = "";
        var listaDeDestaques = new List<String>();
        var listaDeDestaquesTeste = new List<String>();
        var serializer = new JavaScriptSerializer();

        String tema = context.Request.Form["classe"].ToString();
        var numeroArtigosRecebidos = Convert.ToInt32(context.Request.Form["numeroArtigosRecebidos"].ToString());
        var numeroDeArtigosPedidos = Convert.ToInt32(context.Request.Form["numeroDeArtigosPedidos"].ToString());

        switch (tema)
        {
            //fazer a query de acordo com o tema, de forma a ir buscar um certo número de artigos e sabias ordenados pela data (de forma decrescente) EXCEPTO o artigo mais recente
            case "ALIMENTACAO":
                break;
            case "SEXUALIDADE":
                break;
            case "CONSUMOS":
                break;
        } //switch

        //Valores a serem apagados
        try
        {
            for (int i = numeroArtigosRecebidos; i < numeroArtigosRecebidos + numeroDeArtigosPedidos; i++) {
                if (i < 10)
                {
                     /*listaDeDestaques.Add(
                        serializer.Serialize(
                            new { tipo = "ARTIGO", imagem = "imagens/alimentacao_1.png", titulo = "Titulo Artigo", texto = "Isto é texto", url = "1" }
                     ));*/
                     listaDeDestaques.Add(
                        serializer.Serialize(
                            new { tipo = "SABIAS-QUE", texto = "Isto é texto" }
                     ));
                }                                
                else
                {
                    listaDeDestaques.Add(
                        serializer.Serialize(null));
                }

            }
            json = serializer.Serialize(listaDeDestaques);

            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
        catch (Exception ex)
        {

        }

    } //getDestaques

    /////////////////////////ARTIGO EM DESTAQUE/////////////////////////
    public void getArtigoEmDestaque(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();

        String tema = context.Request.Form["classe"].ToString();
        //fazer a query de acordo com o tema, de forma a ir buscar o artigo mais recente
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
        json = serializer.Serialize(
            new {
                imagem = "imagens/alimentacao_1.png",
                titulo = "Por favor funcemina",
                texto = "Se isto funcionar eu mando-me de 2 janelas",
                url = "1"
            });


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getArtigoEmDestaque

    /////////////////////////VIDEOS/////////////////////////
    public void getVideos(HttpContext context)
    {
        String json = "";
        var listaDeVideos = new List<String>();
        var serializer = new JavaScriptSerializer();

        String tema = context.Request.Form["classe"].ToString();
        var numeroVideosRecebidos = Convert.ToInt32(context.Request.Form["numeroVideosRecebidos"].ToString());
        var numeroDeVideosPedidos = Convert.ToInt32(context.Request.Form["numeroDeVideosPedidos"].ToString());

        //Fazer aqui a query à respetiva tabela, de forma a conseguir ter um certo numero de videos do tema
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
        try
        {
            for (int i = numeroVideosRecebidos; i < numeroVideosRecebidos + numeroDeVideosPedidos; i++) {
                if (i < 10)
                {
                    listaDeVideos.Add(
                        serializer.Serialize(
                            new { link = @"https://www.youtube.com/watch?v=GMbn7JY9D1U&list=PLUvc3rGqV5iOiYzMuKRaSU2KW3KiWDw7L&t=0s&index=1", titulo = "Man never hot", texto = "The thing goes skraaaaa" }
                    ));
                }                                
                else
                {
                    listaDeVideos.Add(
                        serializer.Serialize(null));
                }
            }
            json = serializer.Serialize(listaDeVideos);

            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
        catch (Exception ex)
        {

        }
    } //getVideos

    /////////////////////////DOCUMENTOS/////////////////////////
    public void getDocumentos(HttpContext context)
    {
        String json = "";
        var listaDeDocumentos = new List<String>();
        var serializer = new JavaScriptSerializer();

        String tema = context.Request.Form["classe"].ToString();
        //Fazer aqui a query à respetiva tabela, de forma a conseguir ter os documentos do tema
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
        listaDeDocumentos.Add(
            serializer.Serialize(
                new { link = "https://www.youtube.com/watch?v=3M_5oYU-IsU", nome = "Man never hot"}
        ));

        listaDeDocumentos.Add(
            serializer.Serialize(
                new { link = "https://www.youtube.com/watch?v=3M_5oYU-IsU", nome = "Man kinda cold"}
        ));
        json = serializer.Serialize(listaDeDocumentos);


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getDocumentos

    /////////////////////////LINKS/////////////////////////
    public void getLinks(HttpContext context)
    {
        String json = "";
        var listaDeLinks = new List<String>();
        var serializer = new JavaScriptSerializer();

        String tema = context.Request.Form["classe"].ToString();
        //Fazer aqui a query à respetiva tabela, de forma a conseguir ter os links do tema
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
        listaDeLinks.Add(
            serializer.Serialize(
                new { link = "https://www.youtube.com/watch?v=3M_5oYU-IsU", nome = "Man never hot"}
        ));

        listaDeLinks.Add(
            serializer.Serialize(
                new { link = "https://www.youtube.com/watch?v=3M_5oYU-IsU", nome = "Man kinda cold"}
        ));
        json = serializer.Serialize(listaDeLinks);


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getDocumentos


    public bool IsReusable {
        get {
            return false;
        }
    }
}