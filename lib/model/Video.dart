class Video {

  String? id;
  String? titulo;
  String? descricao;
  String? imagem;
  String? canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  /* Resolve mas não otimiza o problema
  static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"]
    );
  }
  */
  //Cria uma unica instancia do objeto e retorna
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"]
  );
  }


}