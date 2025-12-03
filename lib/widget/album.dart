import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';

class Album extends StatefulWidget {
  final InfoAlbum? infoAlbum;
  const Album({Key? key, this.infoAlbum});

  State<Album> createState() => _AlbumsState();
}

class _AlbumsState extends State<Album> {
  late InfoAlbum infoAlbum;
  @override
  void initState() {
    infoAlbum = widget.infoAlbum!;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),

      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("img/${infoAlbum.image}"),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      infoAlbum.nom,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(infoAlbum.description),
                    Text(infoAlbum.nomGroupe),
                  ],
                ),
              ),
            ),
            Container(
              child: Icon(
                infoAlbum.favoriAlbum ? Icons.star : Icons.star_border,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
