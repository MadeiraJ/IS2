<%@ WebHandler Language="C#" Class="HandlerForumTopicoAberto" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Data;

public class HandlerForumTopicoAberto : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-N8IQH97\\SQLEXPRESS;Initial Catalog=yourPEL;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                getRespostas(context, conn);
                break;
            case "2":
                getPergunta(context, conn);
                break;
            case "3":
                getNextPerguntaId(context, conn);
                break;
        } //switch
    } //ProcessRequest


    /////////////////////////PERGUNTA/////////////////////////
    public void getPergunta(HttpContext context, SqlConnection conn)
    {
        String json;
        var serializer = new JavaScriptSerializer();
        var id = Convert.ToInt32(context.Request["id"].ToString());

        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT [POST].[TITULO], [POST].[TEXTO], [POST].[DATA_HORA]" +
            "FROM [YourPEL].[dbo].[RESPOSTA], [YourPEL].[dbo].[POST] WHERE [RESPOSTA].[ID_POST] = [POST].[ID_POST]", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        conn.Close();
        DataTable dt = new DataTable();
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            json = serializer.Serialize(
                new
                {
                    pergunta = dr["TITULO"],
                    texto = dr["TEXTO"],
                    data = dr["DATA_HORA"]
                });

            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
    } //getPergunta


    /////////////////////////RESPOSTAS/////////////////////////
    public void getRespostas(HttpContext context, SqlConnection conn)
    {
        String json;
        var serializer = new JavaScriptSerializer();
        var id = Convert.ToInt32(context.Request["id"].ToString());
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT [RESPOSTA].[ID_UTILIZADOR], [RESPOSTA].[ID_RESPOSTA], [RESPOSTA].[TEXTO], [RESPOSTA].[DATA_HORA]" +
            "FROM [YourPEL].[dbo].[RESPOSTA], [YourPEL].[dbo].[POST] WHERE [RESPOSTA].[ID_POST] = [POST].[ID_POST]", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        conn.Close();
        DataTable dt = new DataTable();
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            json = serializer.Serialize(
                new
                {
                    data = dr["DATA_HORA"],
                    texto = dr["TEXTO"],
                    quemRespondeu = dr["ID_UTILIZADOR"]
                });
            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
    } //getRespostas

    /////////////////////////NEXT PERGUNTA/////////////////////////
    public void getNextPerguntaId(HttpContext context, SqlConnection conn)
    {
        String json;
        var serializer = new JavaScriptSerializer();
        var id = Convert.ToInt32(context.Request["id"].ToString());
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT [RESPOSTA].[ID_POST]-1 FROM [YourPEL].[dbo].[RESPOSTA], [YourPEL].[dbo].[POST] " +
            "WHERE [RESPOSTA].[ID_POST] = [POST].[ID_POST] " +
            "ORDER BY [RESPOSTA].[DATA_HORA] DESC", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        conn.Close();
        DataTable dt = new DataTable();
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            if (dr != null)
            {
                json = id.ToString();

                context.Response.ContentType = "plain/text";
                context.Response.Write(json);
            }
        }
    } //getRespostas



    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}