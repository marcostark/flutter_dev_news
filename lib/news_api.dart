import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi{

    //String url = "";
//
//  Future <List> loadNews() async{
//    // Make a HTTP GET request to the CoinMarketCap API.
//    // Await basically pauses execution until the get() function returns a Response
//    try{
//      http.Response response = await http.get(url);
//      // Using the JSON class to decode the JSON String
//      const JsonDecoder decoder = const JsonDecoder();
//      return decoder.convert(response.body);
//
//    } on Exception catch(_){
//      return null;
//    }
//
//  }
    Future <List> loadNews() async{

      String news = "[  \n" +
          "   {  \n" +
          "      \"id\":\"23658\",\n" +
          "      \"tittle\":\"Flutter 1.0 Is Now Available: Stable Native Cross-Platform Development\",\n" +
          "      \"description\":\"The long awaited initial stable release of Google’s Flutter framework has finally arrived.\",\n" +
          "      \"url_img\":\"https://www.xda-developers.com/files/2018/02/Flutter-Framework-Feature-Image-Purple.png\",\n" +
          "      \"link\":\"https://www.xda-developers.com/flutter-1-0-is-now-available-stable-native-cross-platform-development/\",\n" +
          "      \"origin\":\"xda-developers\",\n" +
          "      \"category\":\"programação\",\n" +
          "      \"date\":\"2018-12-4 12:20:00\"\n" +
          "   },\n" +
          "   {  \n" +
          "      \"id\":\"23670\",\n" +
          "      \"tittle\":\"GitHub Education oferece pacote de desenvolvimento gratuito para escolas\",\n" +
          "      \"description\":\"O GitHub, famoso repositório de código aberto que foi recentemente comprado pela Microsoft, já oferece pacotes destinados aos desenvolvedores do futuro desde 2012.\",\n" +
          "      \"url_img\":\"https://img.ibxk.com.br///2018/06/19/19165440942314-t1200x480.jpg\",\n" +
          "      \"link\":\"https://www.tecmundo.com.br/software/131449-github-education-oferece-pacotes-desenvolvimento-gratuito-escolas.htm\",\n" +
          "      \"origin\":\"Tecmundo\",\n" +
          "      \"category\":\"programação\",\n" +
          "      \"date\":\"2018-07-19 16:55:00\"\n" +
          "   },\n" +
          "   {  \n" +
          "      \"id\":\"23671\",\n" +
          "      \"tittle\":\"IBM lança plataforma móvel de análise de água e solo\",\n" +
          "      \"description\":\"Com sistema baseado em cartão de papel e aplicativo de celular, intenção da empresa é chegar a pequenos produtores rurais\",\n" +
          "      \"url_img\":\"https://s2.glbimg.com/tly-74M7fEk_DhXAzaK62xvFkaU=/780x440/e.glbimg.com/og/ed/f/original/2018/09/05/empresas-ibm-agropad-foto.jpg\",\n" +
          "      \"link\":\"https://revistagloborural.globo.com/Noticias/Empresas-e-Negocios/noticia/2018/09/ibm-lanca-plataforma-movel-de-analise-de-agua-e-solo.html?utm_source=facebook\",\n" +
          "      \"origin\":\"Globo Rural\",\n" +
          "      \"category\":\"aplicativos\",\n" +
          "      \"date\":\"2018-09-05 10:55:02\"\n" +
          "   },\n" +
          "   {  \n" +
          "      \"id\":\"23673\",\n" +
          "      \"tittle\":\"Ranking das Linguagens de Programação mais usadas em 2018 (IEEE Spectrum)\",\n" +
          "      \"description\":\"Conheça o ranking das Linguagens de Programação mais usadas em 2018, feita pelo IEEE Spectrum\",\n" +
          "      \"url_img\":\"https://www.embarcados.com.br/wp-content/uploads/2018/08/spectrum-ieee-ranking-696x418.png\",\n" +
          "      \"link\":\"https://www.embarcados.com.br/linguagens-ieee-spectrum-2018/\",\n" +
          "      \"origin\":\"Embarcados.com.br\",\n" +
          "      \"category\":\"programação\",\n" +
          "      \"date\":\"2018-08-22 10:40:48\"\n" +
          "   },\n" +
          "   {  \n" +
          "      \"id\":\"23673\",\n" +
          "      \"tittle\":\"Our present to you: Become an IBM Advanced Certified Data Scientist for free\",\n" +
          "      \"description\":\"IBM and Coursera are giving away subscriptions worth up to 1 million (U.S.) to help address the lack of skilled data scientists the world is currently facing. \",\n" +
          "      \"url_img\":\"https://developer.ibm.com/site-content/themes/lucio/imglib.php?cb=43&type=Blog\",\n" +
          "      \"link\":\"https://developer.ibm.com/blogs/2018/12/13/promote-the-new-applied-ai-coder-experience/\",\n" +
          "      \"origin\":\"IBM\",\n" +
          "      \"category\":\"AI\",\n" +
          "      \"date\":\"2018-12-13 10:40:48\"\n" +
          "   }\n" +
          "]";

      return json.decode(news);

  }

}