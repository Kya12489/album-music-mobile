import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/screens/detailsAlbum.dart';
import 'package:tp2/widget/album.dart';

class AlbumsList extends StatefulWidget {
  const AlbumsList({super.key});

  @override
  State<AlbumsList> createState() => _AlbumsListState();
}

class _AlbumsListState extends State<AlbumsList> {
  final List<InfoAlbum> _initialList = List.from(InfoAlbum.listeAlbum);
  List<InfoAlbum> listAlbum= InfoAlbum.listeAlbum;
  
  void onFavoritePressed(InfoAlbum album){
    setState(() {
      album.setFavorie(!album.favoriAlbum);
    });
  }

  
  void recherche(String chaineCa) {
     setState(() {
       if (chaineCa.isEmpty) {

        listAlbum = [..._initialList];
       } else {

         listAlbum = _initialList.where((album) {
          String albumName = album.nom.toString().toLowerCase();
          return albumName.contains(chaineCa.toLowerCase());
         }).toList();
       }
     });
   }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        children: [

          for (InfoAlbum album in listAlbum)
            IconButton(
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsAlbum(album: album,onFavoritePressed: onFavoritePressed,),
                  ),
                );
              },

              icon: Album(infoAlbum: album),
            ),
        ],
      ),
    );
  }
}
