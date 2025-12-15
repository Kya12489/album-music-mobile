import 'package:tp2/service/sqfLite/album/albumBdd.dart';

class InfoAlbum {
  static List<InfoAlbum> listeAlbum = [];

  final int id;
  final String nom;
  final String description;
  final String image;
  final String nomGroupe;
  bool favoriAlbum;
  AlbumBdd bdd = AlbumBdd();

  InfoAlbum({
    required this.id,
    required this.nom,
    required this.description,
    required this.nomGroupe,
    required this.image,
    this.favoriAlbum = false
    
  }){
    InfoAlbum.listeAlbum.add(this);
  }

  void setFavorie(bool value){
    value?bdd.addFavorite(this.id):bdd.removeFavorite(this.id);
    this.favoriAlbum = value;
  }
}
