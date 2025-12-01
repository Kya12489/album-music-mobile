import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/screens/accueil.dart';
import 'package:tp2/screens/albums.dart';
import 'package:tp2/screens/setting.dart';
import 'package:tp2/widget/AppBar.dart';
import 'package:tp2/widget/bottomBar.dart';

void main() {
  
    InfoAlbum(
      nom: "Metallica",
      description:
          "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
      nomGroupe: "Metallica",
      image: "Metallica.jpg",
    );
    InfoAlbum(
      nom: "Ride the lighting",
      description: "Ride the lighting est considéré comme ... ",
      nomGroupe: "Metallica",
      image: "Ridethelightning.jpg",
    );
    InfoAlbum(
      nom: "Master of Puppets",
      description: "Master of Puppets est considéré comme ... ",
      nomGroupe: "Metallica",
      image: "Masterofpuppets.jpg",
    );
    InfoAlbum(
      nom: "Hardwired",
      description: "Hardwired est considéré comme ... ",
      nomGroupe: "Metallica",
      image: "Hardwired.jpg",
    );
    InfoAlbum(
      nom: "And justice for all",
      description: "And justice for all est considéré comme ... ",
      nomGroupe: "Metallica",
      image: "Andjusticeforall.jpg",
    );
    InfoAlbum(
      nom: "Kill'em all",
      description: "Kill'em all est considéré comme ... ",
      nomGroupe: "Metallica",
      image: "Killemall.jpg",
    );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  void onDestinationSelected(int index){
    setState(() {
      currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: 
      AppBar_P(title: "Gestion des albums", actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.wb_incandescent),
          onPressed: (){},
        ),
      ]),
      ),
      body: [
        Accueil(),
        AlbumsList(),
        Setting()
      ][currentPageIndex],
      
      floatingActionButton: currentPageIndex==0?FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ):null, 
      bottomNavigationBar: Bottombar_P(onDestinationSelected: onDestinationSelected,currentIndex: currentPageIndex,),
    );
  }
}
