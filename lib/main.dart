import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp2/Dataclasse_API/albumApi.Dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/screens/accueil.dart';
import 'package:tp2/screens/albums.dart';
import 'package:tp2/screens/formulaireAlbum.dart';
import 'package:tp2/screens/setting.dart';
import 'package:tp2/service/api/album/connexionAlbum.dart';
import 'package:tp2/widget/AppBar.dart';
import 'package:tp2/widget/bottomBar.dart';

void initializeAlbums() async {
    try{
      List<AlbumApi>? albumsApi = await ConnexionAlbumAPI().getAlbums() ;
      for(AlbumApi albumApi in albumsApi!){
        debugPrint(albumApi.pochettealbum);
        InfoAlbum(
          id: albumApi.idalbum,
          description: albumApi.descalbum,
          nom: albumApi.nomalbum,
          nomGroupe: albumApi.artistealbum,
          image: albumApi.pochettealbum ?? ""
        );
      }
    }on Exception catch(_){}
    runApp(const MyApp());
  }
void main() {
  initializeAlbums();
  
  
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
        onPressed: (){ 
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormulaireAlbum(),
                      ),
                    );
          
          },
        tooltip: 'Créer un album',
        child: const Icon(Icons.add),
      ):null, 
      bottomNavigationBar: Bottombar_P(onDestinationSelected: onDestinationSelected,currentIndex: currentPageIndex,),
    );
  }
}
