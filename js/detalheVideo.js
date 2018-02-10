var vistaVideo, playlistID, vistaPlaylist, index;
var urlVideo, id;
var videos;
var zonaVerVideo;
var main, close;
var titulo, descricao;
var cor;
function verVideo(elemento){
  main = document.getElementById('zonaMain');
  zonaVerVideo = document.getElementById('zonavideoDetalhe');
  close = document.getElementById('fechar');
  titulo = document.getElementById('tituloVideo');
  descricao = document.getElementById('descricaoVideo');

  mudarInfo(true, elemento);

  verCores();

  urlVideo = elemento.getAttribute("name");
  
  vistaVideo = document.getElementById('vistaVideo');
  playlistID = urlVideo.split("list=")[1];
  vistaPlaylist = document.getElementById('vistaPlaylist');

  getPlaylistData(playlistID);
}

function verCores(){
  var tema = document.body.className.split(" ")[1];
  if (tema == "alimentacao") {
    cor = "#F2A618";
    close.style.backgroundImage = 'url("./imagens/DetalheVideo/fecharA.png")';
  }else if (tema == "consumos") {
    cor = "#24D7B4";
    close.style.backgroundImage = 'url("./imagens/DetalheVideo/fecharC.png")';
  }else if (tema == "sexualidade") {
    cor = "#6153CC";
    close.style.backgroundImage = 'url("./imagens/DetalheVideo/fecharS.png")';
  }
}

function mudarInfo(infoDoSite, elemento){
  if(infoDoSite){
    titulo.innerHTML = elemento.firstElementChild.children[1].innerHTML;
    descricao.innerHTML = elemento.firstElementChild.children[2].innerHTML;
  } else {
    titulo.innerHTML = elemento.snippet.title;
    descricao.innerHTML = elemento.snippet.description;
  }
}

function getPlaylistData(playlistID, video_list, page_token) { //Makes a single request to Youtube Data API
  var apiKey = 'AIzaSyArQNfmJDkjxP_ZyZIocbyuDeyTanf4Rl8';
  var theUrl =
  'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet' +
  '&playlistId=' + playlistID +
  '&key=' + apiKey
  ;
  if(page_token){ theUrl +=('&pageToken=' + page_token );} //If there is page token, start there
  var xmlHttp = null;
  xmlHttp = new XMLHttpRequest();
  xmlHttp.open( "GET", theUrl, true);
  xmlHttp.send( null );
  xmlHttp.onload = function (e) { //when the request comes back
    buildJSON(xmlHttp.responseText, video_list, playlistID); //send the data to buildJSON
  };
}

function buildJSON(response, list, playlistID){ //Takes the text response and adds it to any existing JSON data
  var results = JSON.parse(response); //Parse it
  if(!list){ list = []; } //If there is no list to add to, make one
  list.push.apply(list,results.items); //Add JSON data to the list
  if(results.nextPageToken){ //If the results included a page token
    getPlaylistData(playlistID, list, results.nextPageToken); //Create another data API request including the current list and page token
  } else { //If there is not a next-page token
    videos = list;
    buildHTML(list); //Send the JSON data to buildHTML
  }
}

function buildHTML(data){ //Turns JSON data into HTML elements
  var list_data = ''; //A string container
  for(i = 0; i < data.length; i++){ //Do this to each item in the JSON list
    var item = data[i].snippet; //Each Youtube playlist item snippet
    if(!item.thumbnails){continue;} //private videos do no reveal thumbs, so skip them
    list_data += '<li data-ypt-index="'+ i +'" onclick="mudarVideo(this)"><div style="display=none"><p>' + item.title + '</p></div><span><img alt="'+ item.title +'" src="'+ item.thumbnails.medium.url +'"/></span></li>'; //create an element and add it to the list
  }
  vistaPlaylist.innerHTML = list_data; //After the for loop, insert that list of links into the html
  verificarQual();
}

function verificarQual(){
  var idVideoAtual = urlVideo.split("&list=")[0];
  id = idVideoAtual.split("watch?v=")[1];
  for(var i = 0; i < videos.length; i++){ 
    var item = videos[i].snippet;
    if(!item.thumbnails){continue;}
    if(item.resourceId.videoId == id) {
      index = i;
    }
  }
  construirVideo(id);
  vistaPlaylist.childNodes[index].childNodes[0].style.display = "block";
  vistaPlaylist.childNodes[index].childNodes[0].style.color = cor;
  zonaVerVideo.style.display = "block";
  main.style.display = "none";
}

function construirVideo(x){
    vistaVideo.innerHTML = "<iframe src='https://www.youtube.com/embed/"+x+"'></iframe>";
}

function mudarVideo(elemento){
    vistaPlaylist.childNodes[index].childNodes[0].style.display = "none";
    vistaPlaylist.childNodes[index].childNodes[0].style.color = "#FFFFFF";
    index = elemento.getAttribute('data-ypt-index');
    elemento.childNodes[0].style.display = "block";
    elemento.childNodes[0].style.color = cor;
    construirVideo(videos[index].snippet.resourceId.videoId);
    mudarInfo(false, videos[index]);
    //vistaPlaylist.scrollTop = elemento.top;
}

function fechar(){
  zonaVerVideo.style.display = "none";
  main.style.display = "block";
}