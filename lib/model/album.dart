class InfoAlbum {
  static List<InfoAlbum> listeAlbum = [];

  final String nom;
  final String description;
  final String image;
  final String nomGroupe;
  bool favoriAlbum;

  InfoAlbum({
    required this.nom,
    required this.description,
    required this.nomGroupe,
    required this.image,
    this.favoriAlbum = false
    
  }){
    InfoAlbum.listeAlbum.add(this);
  }

  void setFavorie(bool value){
    this.favoriAlbum = value;
  }
}
