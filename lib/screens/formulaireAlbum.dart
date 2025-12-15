import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/service/api/album/connexionAlbum.dart';
import 'package:tp2/widget/appBar.dart';

class FormulaireAlbum extends StatefulWidget {
  const FormulaireAlbum({super.key});

  @override
  State<FormulaireAlbum> createState() => _FormulaireAlbumState();
}



class _FormulaireAlbumState extends State<FormulaireAlbum> {
  final _formKey = GlobalKey<FormState>();
  var _nomAlbum = "";
  var _descAlbum = "";
  var _artisteAlbum = "";
  var _pochetteAlbum = "";
  var _compoAlbum = "";
  var _youtubeAlbum = "";
  var _lienArtisteAlbum = "";
  var _groupeAlbum = false;




  bool createAlbum()  {
    try{
      InfoAlbum(description: _descAlbum,nom: _nomAlbum,nomGroupe: _artisteAlbum,image: _pochetteAlbum);
      ConnexionAlbumAPI.createAlbum(_nomAlbum,_descAlbum,_artisteAlbum,_groupeAlbum,_pochetteAlbum,_compoAlbum,_youtubeAlbum,_lienArtisteAlbum);
      Navigator.pop(context);
      return true;
       
    }on Exception catch(exception){
      return false;
    }
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBar_P(title: "Créer un album")),
      body: ListView(
        children:[
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                                
                  decoration: const InputDecoration(
                     labelText: 'Nom',
                
                  ),
                  validator: (value) {
                     if (value!.isEmpty) {
                       return 'Veuillez entrer un nom ablum';
                     }
                     _nomAlbum = value; 
                  },
                 ),
                TextFormField(
                                
                  decoration: const InputDecoration(
                     labelText: 'Description',
                
                  ),
                  validator: (value) {
                     if (value!.isEmpty) {
                       return 'Veuillez entrer une description ablum';
                     }
                     _descAlbum = value; 
                  },
                 ),
                 TextFormField(
                                
                  decoration: const InputDecoration(
                     labelText: 'Artiste',
                
                  ),
                  validator: (value) {
                     if (value!.isEmpty) {
                       return 'Veuillez entrer un Artiste ablum';
                     }
                     _artisteAlbum = value; 
                  },
                 ),
                 //bool
                 Row(
                  children: [
                    Text("Est un groupe : "),
                    Checkbox(value: _groupeAlbum, onChanged: (value){
                      setState(() {
                        _groupeAlbum = !_groupeAlbum;
                      });
                    })
                  ],
                 ),
                 //fin bool
                 TextFormField(
                                
                  decoration: const InputDecoration(
                     labelText: 'Pochette',
                
                  ),
                  validator: (value) {
                     if (value!.isEmpty) {
                       return 'Veuillez entrer un pochette ablum';
                     }
                     _pochetteAlbum = value; 
                  },
                 ),
                 
                 TextFormField(
                                
                  decoration: const InputDecoration(
                     labelText: 'Composition',
                
                  ),
                  validator: (value) {
                     if (value!.isEmpty) {
                       return 'Veuillez entrer un compo ablum';
                     }
                     _compoAlbum = value; 
                  },
                 ),
                 TextFormField(
                                
                  decoration: const InputDecoration(
                     labelText: 'Lien youtube',
                
                  ),
                  validator: (value) {
                     if (value!.isEmpty) {
                       return 'Veuillez entrer un lien youtube de l\'ablum';
                     }
                     _youtubeAlbum = value; 
                  },
                 ),
                 TextFormField(
                                
                  decoration: const InputDecoration(
                     labelText: 'Lien de l\'artiste',
                
                  ),
                  validator: (value) {
                     if (value!.isEmpty) {
                       return 'Veuillez entrer un lien de l\'artiste de l\' ablum';
                     }
                     _lienArtisteAlbum = value; 
                  },
                 ),
              ],
            )
            ),
            ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //Appel de la méthode permettant l’ajout de l’album
                        if(!createAlbum()){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Erreur de création',
                              ),
                            ),
                          );
                        
                        }
                      }
                      
                    },
                    child: const Text('Ajouter l’album'),
                  ),

        ],
      ),
    );
  }
}