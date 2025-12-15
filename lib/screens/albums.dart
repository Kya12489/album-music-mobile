import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp2/Dataclasse_API/albumApi.Dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/screens/detailsAlbum.dart';
import 'package:tp2/service/api/album/connexionAlbum.dart';
import 'package:tp2/widget/album.dart';

class AlbumsList extends StatefulWidget {
  const AlbumsList({super.key});

  @override
  State<AlbumsList> createState() => _AlbumsListState();
}

class _AlbumsListState extends State<AlbumsList> {
  List<InfoAlbum> _initialList = List.from(InfoAlbum.listeAlbum);
  List<InfoAlbum> listAlbum = [];
  TextEditingController _rechercheController = TextEditingController();
  List<AlbumApi>? listeAlbumApi = [];
  @override
  void initState() {
    
    setState(() {
      listAlbum = [..._initialList];
    });

    super.initState();
  }


  void onFavoritePressed(InfoAlbum album) {
    setState(() {
      album.setFavorie(!album.favoriAlbum);
    });
  }

  void recherche() {
    
    String chaineCa = _rechercheController.value.text;
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _rechercheController,
              onChanged: (value) {
                recherche();
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Rechercher un album',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              key: ValueKey(listAlbum), // ← Ajoutez cette clé
              padding: const EdgeInsets.fromLTRB(2, 0, 2, 10),
              itemCount: listAlbum.length,
              itemBuilder: (context, index) {
                final album = listAlbum[index];
                return GestureDetector(
                  onTap: () {
                    
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsAlbum(
                          album: album,
                          onFavoritePressed: onFavoritePressed,
                        ),
                      ),
                    );
                  },
                  child: Album(infoAlbum: album),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
