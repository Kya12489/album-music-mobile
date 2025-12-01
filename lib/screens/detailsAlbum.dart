import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/widget/AppBar.dart';

class DetailsAlbum extends StatefulWidget {
  final InfoAlbum album;
  final Function onFavoritePressed;
  const DetailsAlbum({super.key, required this.album,required this.onFavoritePressed});

  @override
  State<DetailsAlbum> createState() => DetailsalbumState();
}

class DetailsalbumState extends State<DetailsAlbum> {
  late InfoAlbum album;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.album = widget.album;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar_P(title: "Information sur l'album ${album.nom}"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("img/${album.image}"),
                IconButton(
                  icon: Container(child: Icon(album.favoriAlbum ? Icons.star : Icons.star_border,),color: Colors.green,),
                  color: album.favoriAlbum ? Colors.black : Colors.black,
                  
                  onPressed: (){
                    setState(() {
                      widget.onFavoritePressed(album);
                    });
                    
                  },
                ),],
                ),
                Text(album.nom),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(16),
                    child: Column(
                      children: [
                        Text("Groupe : ${album.nomGroupe}"),
                        Text("Information Supplementaire"),
                        Text(album.description),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}