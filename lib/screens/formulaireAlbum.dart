import 'package:flutter/material.dart';
import 'package:tp2/model/album.dart';
import 'package:tp2/service/api/album/connexionAlbum.dart';
import 'package:tp2/widget/appBar.dart';

class FormulaireAlbum extends StatefulWidget {
  final InfoAlbum? infoAlbum;
  const FormulaireAlbum({super.key, this.infoAlbum});

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
  var isEditMode = false;
  var infoAlbum;

  bool setInformationAlbum(){
    if(infoAlbum != null){
      _nomAlbum = widget.infoAlbum!.nom;
      _descAlbum = widget.infoAlbum!.description;
      _artisteAlbum = widget.infoAlbum!.nomGroupe;
      _pochetteAlbum = widget.infoAlbum!.image;
      _groupeAlbum = widget.infoAlbum!.estUnGroupe;
      _compoAlbum = widget.infoAlbum!.compoAlbum;
      _youtubeAlbum = widget.infoAlbum!.ytbUrl;
      _lienArtisteAlbum = widget.infoAlbum!.artisteUrl;
      return true;
    }
    return false;
  }

  @override
  void initState() {
    infoAlbum = widget.infoAlbum;
    isEditMode = setInformationAlbum();
    super.initState();
  }

bool updateAlbum()  {
    try{
      infoAlbum.editInfo(_nomAlbum,_descAlbum,_artisteAlbum,_groupeAlbum,_pochetteAlbum,_compoAlbum,_youtubeAlbum,_lienArtisteAlbum);
      ConnexionAlbumAPI.EditAlbum(widget.infoAlbum!.id,_nomAlbum,_descAlbum,_artisteAlbum,_groupeAlbum,_pochetteAlbum,_compoAlbum,_youtubeAlbum,_lienArtisteAlbum);
      Navigator.pop(context);
      return true;
       
    }on Exception catch(exception){
      return false;
    }
    
    
  }
  bool createAlbum()  {
    try{
      InfoAlbum(id:InfoAlbum.listeAlbum.last.id+1,description: _descAlbum,nom: _nomAlbum,nomGroupe: _artisteAlbum,image: _pochetteAlbum,estUnGroupe: _groupeAlbum,compoAlbum: _compoAlbum,ytbUrl: _youtubeAlbum,artisteUrl: _lienArtisteAlbum);
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
                  initialValue: _nomAlbum,
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom ablum';
                    }
                    return null;
                  },
                  onSaved: (value) => _nomAlbum = value ?? '',
                ),
                TextFormField(
                  initialValue: _descAlbum,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une description ablum';
                    }
                    return null;
                  },
                  onSaved: (value) => _descAlbum = value ?? '',
                ),
                 TextFormField(
                  initialValue: _artisteAlbum,
                  decoration: const InputDecoration(
                    labelText: 'Artiste',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un Artiste ablum';
                    }
                    return null;
                  },
                  onSaved: (value) => _artisteAlbum = value ?? '',
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
                  initialValue: _pochetteAlbum,
                  decoration: const InputDecoration(
                    labelText: 'Pochette',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un pochette ablum';
                    }
                    return null;
                  },
                  onSaved: (value) => _pochetteAlbum = value ?? '',
                ),
                 
                 TextFormField(
                  initialValue: _compoAlbum,
                  decoration: const InputDecoration(
                    labelText: 'Composition',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un compo ablum';
                    }
                    return null;
                  },
                  onSaved: (value) => _compoAlbum = value ?? '',
                ),
                 TextFormField(
                  initialValue: _youtubeAlbum,
                  decoration: const InputDecoration(
                    labelText: 'Lien youtube',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un lien youtube de l\'ablum';
                    }
                    return null;
                  },
                  onSaved: (value) => _youtubeAlbum = value ?? '',
                ),
                 TextFormField(
                  initialValue: _lienArtisteAlbum,
                  decoration: const InputDecoration(
                    labelText: 'Lien de l\'artiste',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un lien de l\'artiste de l\' ablum';
                    }
                    return null;
                  },
                  onSaved: (value) => _lienArtisteAlbum = value ?? '',
                ),
              ],
            )
            ),
            isEditMode ?ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        
                        if(!updateAlbum()){
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
                    child: const Text('Modifier l’album'),
                  ) :
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        
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
                  ) 

        ],
      ),
    );
  }
}