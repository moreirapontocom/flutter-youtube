class Video {

  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({ this.id, this.titulo, this.descricao, this.imagem, this.canal });

  // O factory é utilizado para criar apenas uma instância da classe.
  // Este método abaixo (construtor nomeado) é chamado por uma função map(), que faz o mesmo processo de um for().
  // Se o array de itens percorrido tiver 100 itens, ao invés de ocupar 100 espaços de memória para as 100 instâncias da classe Video(),
  // O factory instancia a classe apenas 1 vez e a cada chamada, apenas altera os dados.

  factory Video.fromJson(Map<String, dynamic> json) {

    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      descricao: json['snippet']['description'],
      imagem: json['snippet']['thumbnails']['high']['url'],
      canal: json['snippet']['channelId']
    );

  }

}