import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tp2/Dataclasse_API/albumApi.Dart';
import 'package:tp2/model/album.dart';

class ConnexionAlbumAPI {
 Future<List<AlbumApi>?> getAlbums() async {
  try {
   var uri = Uri.parse('http://192.168.203.10:81/api/albums');
   var response = await http.get(uri);
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((album) => AlbumApi.fromJson(album)).toList();
   
  } catch (e) {
   print('Erreur : $e');
  }
  return null;
  }
  
  
  static  Future<bool> createAlbum(String nomAlbum, String descAlbum,String artisteAlbum, bool groupeAlbum, String pochetteAlbum, String compoAlbum,String linkyoualbum,String linkartistealbum) async {
  final response = await http.post(
    Uri.parse('http://192.168.203.10:81/api/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      
      "nomalbum": nomAlbum,
      "descalbum": descAlbum,
      "artistealbum": artisteAlbum,
      "groupealbum": groupeAlbum,
      "pochettealbum": pochetteAlbum,
      "compositeuralbum": compoAlbum,
      "linkyoualbum":linkyoualbum,
      "linkartistealbum":linkartistealbum
    }),
  );

  if (response.statusCode == 201) {
    // si 201 alors l’enregistrement est bien créé
    return true;
  } else {
     return false;
     
  }
}

static  Future<bool> EditAlbum(int id,String nomAlbum, String descAlbum,String artisteAlbum, bool groupeAlbum, String pochetteAlbum, String compoAlbum,String linkyoualbum,String linkartistealbum) async {
  final response = await http.put(
    Uri.parse('http://192.168.203.10:81/api/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "idalbum": id,  
      "nomalbum": nomAlbum,
      "descalbum": descAlbum,
      "artistealbum": artisteAlbum,
      "groupealbum": groupeAlbum,
      "pochettealbum": pochetteAlbum,
      "compositeuralbum": compoAlbum,
      "linkyoualbum":linkyoualbum,
      "linkartistealbum":linkartistealbum
    }),
  );

  if (response.statusCode == 201) {
    return true;
  } else {
     return false;
     
  }
}

}
