import 'package:tp2/service/sqfLite/album/albumBdd.dart';

class InfoAlbum {
  static List<InfoAlbum> listeAlbum = [];

  final int id;
  String nom;
  String description;
  String image;
  String nomGroupe;
  String ytbUrl;
  String artisteUrl;
  String compoAlbum;
  bool estUnGroupe;
  bool favoriAlbum;
  AlbumBdd bdd = AlbumBdd();

  InfoAlbum({
    required this.id,
    required this.nom,
    required this.description,
    required this.nomGroupe,
    required this.image,
    required this.estUnGroupe,
    required this.compoAlbum,
    this.favoriAlbum = false,
    this.ytbUrl = "",
    this.artisteUrl = "",
    
  }){
    InfoAlbum.listeAlbum.add(this);
  }

  void editInfo(String nomAlbum, String descAlbum,String artisteAlbum, bool groupeAlbum, String pochetteAlbum, String compoAlbum,String linkyoualbum,String linkartistealbum){
    this.nom = nomAlbum;
    this.description = descAlbum;
    this.nomGroupe = artisteAlbum;
    this.estUnGroupe = groupeAlbum;
    this.image = pochetteAlbum;
    this.compoAlbum = compoAlbum;
    this.ytbUrl = linkyoualbum;
    this.artisteUrl = linkartistealbum;

  }

  void setFavorie(bool value){
    value?bdd.addFavorite(this.id):bdd.removeFavorite(this.id);
    this.favoriAlbum = value;
  }
}
