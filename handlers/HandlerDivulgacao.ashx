<%@ WebHandler Language="C#" Class="HandlerDivulgacao" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class HandlerDivulgacao : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                getNoticias(context);
                break;
            case "2":
                getEventos(context);
                break;
            case "3":
                getPublicacoes(context);
                break;
        }
    } //ProcessRequest


    /////////////////////////NOTICIAS/////////////////////////
    public void getNoticias(HttpContext context)
    {
        String json = "";
        var listaDeNoticias = new List<String>();
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar todas as noticias
        var numeroNoticiasRecebidos = Convert.ToInt32(context.Request.Form["numeroNoticiasRecebidos"].ToString());
        var numeroDeNoticiasPedidos = Convert.ToInt32(context.Request.Form["numeroDeNoticiasPedidos"].ToString());
        //Valores a serem apagados
        for (int i = 0; i < numeroDeNoticiasPedidos; i++)
            listaDeNoticias.Add(
                serializer.Serialize(
                    new
                    {
                        imagem = "imagens/alimentacao_3.jpg",
                        data = "12 Janeiro 2017",
                        titulo = "Va laaaaaaaa",
                        texto = "PLEEEEEEEASE",
                        url = "artigo_exemplo.html"
                    }
            ));

        json = serializer.Serialize(listaDeNoticias);

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getNoticias

    /////////////////////////EVENTOS/////////////////////////
    public void getEventos(HttpContext context)
    {
        String json = "";
        var listaDeEventos = new List<String>();
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar todos os eventos
        var numeroEventosRecebidos = Convert.ToInt32(context.Request.Form["numeroEventosRecebidos"].ToString());
        var numeroDeEventosPedidos = Convert.ToInt32(context.Request.Form["numeroDeEventosPedidos"].ToString());
        //Valores a serem apagados
        for (int i = 0; i < numeroDeEventosPedidos; i++)
            listaDeEventos.Add(
                serializer.Serialize(
                    new {
                        data = "data",
                        horas = "horas",
                        local = "local",
                        titulo = "titulo",
                        descricao = "descricao",
                        imagem = "imagens/evento1.png"
                    }
            ));

        json = serializer.Serialize(listaDeEventos);

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getEventos

    /////////////////////////PUBLICAÇÕES/////////////////////////
    public void getPublicacoes(HttpContext context)
    {
        String json = "";
        var listaDePublicacoes = new List<String>();
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar todas as publicações

        //Valores a serem apagados
        listaDePublicacoes.Add(
            serializer.Serialize(
                new {
                    titulo = "Livros publicados/organizados ou edições",
                    conteudo = "<ul>"+
                            "<li>Amendoeira, José J. P. (2006). Uma biografia partilhada da enfermagem. a segunda metade do século XX. ed. 1, 1 vol., ISBN: 972-8485-67-0. Coimbra: Formasau.</li>"+
                            "<li> Silva, Mário (2010). Adesão ao regime terapêutico. Coimbra. Formasau. ISBN 978-989-8269-10-2</li>"+
                            "</ul>"
                }
            ));
        
       listaDePublicacoes.Add(
            serializer.Serialize(
                new {
                    titulo = "Capítulos de livros publicados",
                    conteudo = "<ul>"+
                            "<li>Amendoeira, José J. P. (2006). Uma biografia partilhada da enfermagem. a segunda metade do século XX. ed. 1, 1 vol., ISBN: 972-8485-67-0. Coimbra: Formasau.</li>"+
                            "<li> Silva, Mário (2010). Adesão ao regime terapêutico. Coimbra. Formasau. ISBN 978-989-8269-10-2</li>"+
                            "</ul>"
                }
            ));

       listaDePublicacoes.Add(
            serializer.Serialize(
                new {
                    titulo = "Artigos em revistas com arbitragem científica",
                    conteudo = "<ul>"+
                            "<li>Amendoeira, José J. P. (2006). Uma biografia partilhada da enfermagem. a segunda metade do século XX. ed. 1, 1 vol., ISBN: 972-8485-67-0. Coimbra: Formasau.</li>"+
                            "<li> Silva, Mário (2010). Adesão ao regime terapêutico. Coimbra. Formasau. ISBN 978-989-8269-10-2</li>"+
                            "</ul>"
                }
            ));
        
       listaDePublicacoes.Add(
            serializer.Serialize(
                new {
                    titulo = "Comunicações orais e posters em atividades científicas",
                    conteudo = "<ul>"+
                            "<li>Amendoeira, José J. P. (2006). Uma biografia partilhada da enfermagem. a segunda metade do século XX. ed. 1, 1 vol., ISBN: 972-8485-67-0. Coimbra: Formasau.</li>"+
                            "<li> Silva, Mário (2010). Adesão ao regime terapêutico. Coimbra. Formasau. ISBN 978-989-8269-10-2</li>"+
                            "</ul>"
                }
            ));

        json = serializer.Serialize(listaDePublicacoes);

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getEventos

    public bool IsReusable {
        get {
            return false;
        }
    }

}