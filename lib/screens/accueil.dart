import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tp2/widget/album.dart';
import 'package:tp2/widget/carouselSlider.dart';

class Accueil extends StatefulWidget {
  Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int indexC = 0;
  CarouselSliderController _controller = CarouselSliderController();
  final List<Map<String, String>> listAlbum = [
    {
      "nom": "Metallica",
      "description":
          "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
      "nomgroupe": "Metallica",
      "image": "Metallica.jpg",
    },
    {
      "nom": "Ride the lighting",
      "description": "Ride the lighting est considéré comme ... ",
      "nomgroupe": "Metallica",
      "image": "Ridethelightning.jpg",
    },
    {
      "nom": "Master of Puppets",
      "description": "Master of Puppets est considéré comme ... ",
      "nomgroupe": "Metallica",
      "image": "Masterofpuppets.jpg",
    },
  ];

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
                      child: Image.asset("img/${album['image']}"),
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
