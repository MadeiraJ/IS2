<%@ WebHandler Language="C#" Class="ArtigosHandler" %>

using System;
using System.Text;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class ArtigosHandler : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        var serializer = new JavaScriptSerializer();
        var listaDeRelacionados = new List<String>();
        
        var artigo = context.Request["artigo"];
        var id = Convert.ToInt32(artigo.ToString());
       //fazer select na tabela de artigos com o id acima mencionado
        
        //Valores a serem apagados

        //Listar 3 ou menos artigos do mesmo tema
        listaDeRelacionados.Add(
            serializer.Serialize(
                new { imagemCapa = "imagens/alimentacao_1.png", titulo = "ARTIGO", resumo = "Isto e texto Alimentacaoo", numeroArtigo = "1" }
        ));
        listaDeRelacionados.Add(
            serializer.Serialize(
                new { imagemCapa = "imagens/alimentacao_1.png", titulo = "ARTIGO", resumo = "Isto e texto Alimentacaoo", numeroArtigo = "1" }
        ));
        listaDeRelacionados.Add(
            serializer.Serialize(
                new { imagemCapa = "imagens/alimentacao_1.png", titulo = "ARTIGO", resumo = "Isto e texto Alimentacaoo", numeroArtigo = "1" }
        ));

        /*String texto = @"<p>As mudanças ocorridas nos últimos anos na saúde da população portuguesa melhoraram significativamente, contudo, os jovens requerem particular atenção relativamente, aos determinantes da saúde relacionados com o estilo de vida. A evidência científica em promoção da saúde em meio escolar, a inovação e a necessidade de recentrar a ação nos resultados implica o desenvolvimento de intervenções mais adequadas à população jovem. Além de capacitar as pessoas e as comunidades para agir, implica reconhecer as suas competências e potencialidades e facilitar as suas escolhas.</p>
                    <br>
                    <blockquote>O projeto Your PEL - Promover e Empoderar para a Literacia em saúde na população jovem tem como finalidade ajudar esta geração a atingir a plenitude do seu potencial de saúde.</blockquote>
                    <br>
                    <p>As mudanças ocorridas nos últimos anos na saúde da população portuguesa melhoraram significativamente, contudo, os jovens requerem particular atenção relativamente, aos determinantes da saúde relacionados com o estilo de vida. A evidência científica em promoção da saúde em meio escolar, a inovação e a necessidade de recentrar a ação nos resultados implica o desenvolvimento de intervenções mais adequadas à população jovem. Além de capacitar as pessoas e as comunidades para agir, implica reconhecer as suas competências e potencialidades e facilitar as suas escolhas.
                    O projeto “Your PEL - Promover e Empoderar para a Literacia em saúde na população jovem” tem como finalidade ajudar esta geração a atingir a plenitude do seu potencial de saúde. Centra-se numa abordagem da saúde ao longo do ciclo de vida, especificamente uma juventude à procura de um futuro saudável e integra três áreas específicas: alimentação, consumos nocivos e sexualidade.
                    <br>
                    <img class=""wow pulse"" src=""imagens/photo.png"">
                    <br>
                    As mudanças ocorridas nos últimos anos na saúde da população portuguesa melhoraram significativamente, contudo, os jovens requerem particular atenção relativamente, aos determinantes da saúde relacionados com o estilo de vida. A evidência científica em promoção da saúde em meio escolar, a inovação e a necessidade de recentrar a ação nos resultados implica o desenvolvimento de intervenções mais adequadas à população jovem. Além de capacitar as pessoas e as comunidades para agir, implica reconhecer as suas competências e potencialidades e facilitar as suas escolhas.
                    O projeto “Your PEL - Promover e Empoderar para a Literacia em saúde na população jovem” tem como finalidade ajudar esta geração a atingir a plenitude do seu potencial de saúde. Centra-se numa abordagem da saúde ao longo do ciclo de vida, especificamente uma juventude à procura de um futuro saudável e integra três áreas específicas: alimentação, consumos nocivos e sexualidade.
                    As mudanças ocorridas nos últimos anos na saúde da população portuguesa melhoraram significativamente, contudo, os jovens requerem particular atenção relativamente, aos determinantes da saúde relacionados com o estilo de vida. A evidência científica em promoção da saúde em meio escolar, a inovação e a necessidade de recentrar a ação nos resultados implica o desenvolvimento de intervenções mais adequadas à população jovem. Além de capacitar as pessoas e as comunidades para agir, implica reconhecer as suas competências e potencialidades e facilitar as suas escolhas.
                    O projeto “Your PEL - Promover e Empoderar para a Literacia em saúde na população jovem” tem como finalidade ajudar esta geração a atingir a plenitude do seu potencial de saúde. Centra-se numa abordagem da saúde ao longo do ciclo de vida, especificamente uma juventude à procura de um futuro saudável e integra três áreas específicas: alimentação, consumos nocivos e sexualidade.</p>
            </div>";*/
        String texto = @"<p>As mudanças nas Bulimia ocorridas nos últimos anos na saúde da população portuguesa melhoraram significativamente, contudo, os jovens requerem particular atenção relativamente, aos determinantes da saúde relacionados com o estilo de vida. A evidência científica em promoção da saúde em meio escolar, a inovação e a necessidade de recentrar a ação nos resultados implica o desenvolvimento de intervenções mais adequadas à população jovem. Além de capacitar as pessoas e as comunidades para agir, implica reconhecer as suas competências e potencialidades e facilitar as suas escolhas.</p>
                    <br>
                    <blockquote>A ABSTINÊNCIA Your PEL - Promover e Empoderar para a Literacia em saúde na população jovem tem como finalidade ajudar esta geração a atingir a plenitude do seu potencial de saúde.</blockquote>
                    <br>
                    <p>As mudanças ocorridas nos últimos anos na saúde da população portuguesa melhoraram significativamente, contudo, os jovens requerem particular atenção relativamente, aos determinantes da saúde relacionados com o estilo de vida. A evidência científica em promoção da saúde em meio escolar, a inovação e a necessidade de recentrar a ação nos resultados implica o desenvolvimento de intervenções mais adequadas à população jovem. Além de capacitar as pessoas e as comunidades para agir, implica reconhecer as suas competências e potencialidades e facilitar as suas escolhas.
                    O projeto “Your Lactose - Promover e Empoderar para a Literacia em saúde na população jovem” tem como finalidade ajudar esta geração a atingir a plenitude do seu potencial de saúde. Centra-se numa abordagem da saúde ao longo do ciclo de vida, especificamente uma juventude à procura de um futuro saudável e integra três áreas específicas: alimentação, consumos nocivos e sexualidade.
                    <br>
                    <img class=""wow pulse"" src=""imagens/photo.png"">
                    <br>
                    As mudanças ocorridas nos últimos anos na saúde da população portuguesa melhoraram significativamente, contudo, os jovens requerem particular atenção relativamente, aos determinantes da saúde relacionados com o estilo de vida. A evidência científica em promoção da saúde em meio escolar, a inovação e a necessidade de recentrar a ação nos resultados implica o desenvolvimento de intervenções mais adequadas à população jovem. Além de capacitar as pessoas e as comunidades para agir, implica reconhecer as suas competências e potencialidades e facilitar as suas escolhas.
                    A ASSEXUAL “Your Lactose - Promover e Empoderar para a Literacia em saúde na população jovem” tem como finalidade ajudar esta geração a atingir a plenitude do seu potencial de saúde. Centra-se numa abordagem da saúde ao longo do ciclo de vida, especificamente uma juventude à procura de um futuro saudável e integra três áreas específicas: alimentação, consumos nocivos e sexualidade.
                    As mudanças ocorridas nos últimos anos na saúde da população portuguesa melhoraram significativamente, contudo, os jovens requerem particular atenção relativamente, aos determinantes da saúde relacionados com o estilo de vida. A evidência científica em promoção da saúde em meio escolar, a inovação e a necessidade de recentrar a ação nos resultados implica o desenvolvimento de intervenções mais adequadas à população jovem. Além de capacitar as pessoas e as comunidades para agir, implica reconhecer as suas competências e potencialidades e facilitar as suas escolhas.
                    O projeto “Your Lactose - Promover e Empoderar para a Literacia em saúde na população jovem” tem como finalidade ajudar esta geração a atingir a plenitude do seu potencial de saúde. Centra-se numa abordagem da saúde ao longo do ciclo de vida, especificamente uma juventude à procura de um futuro saudável e integra três áreas específicas: alimentação, consumos nocivos e sexualidade.</p>
            </div>";

        byte[] bytes = Encoding.Default.GetBytes(texto);
        texto = Encoding.UTF8.GetString(bytes);
              
        var json = serializer.Serialize(
            new {
                autor = "AUTOR",
                data = "16 de Novembro de 2017",
                //tipo = "ALIMENTACAO",
                //tipo = "CONSUMOS",
                tipo = "SEXUALIDADE",
                imagemCapa = "imagens/alimentacao_1.png",
                titulo = "Por favor funcemina",
                texto = texto,
                artigosRelacionados = serializer.Serialize(listaDeRelacionados)
            });

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
        
     } //ProcessRequest

    public bool IsReusable {
        get {
            return false;
        }
    }

}
