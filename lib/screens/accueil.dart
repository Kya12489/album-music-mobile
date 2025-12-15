import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/widget/carouselSlider.dart';

class Accueil extends StatefulWidget {
  Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int indexC = 0;
  final List<InfoAlbum> listAlbum = List.from(InfoAlbum.listeAlbum);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Image.asset("img/imgAccueil/vinyltransp.webp"),
              Flexible(
                child: Text(
                  "Bienvenue sur l'application de gestion d'album",
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(4),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text:
                            "Bienvenue sur l'application de gestion d'album\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "Voici les nouveaux albums ajoutés"),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                CarouselSliderC(
                  items: listAlbum.map((album) {
                    return Container(
                      child: Image.network(album.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover, errorBuilder:
                              (context, error, stackTrace) {
                        return Container(
                          width: 200,
                          height: 200,
                          color: Colors.grey[200],
                          alignment: Alignment.center,
                          child: Text("No image found"),
                        );
                      } ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(4),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Version 1 en cours de developpement\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "Wait and see"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
