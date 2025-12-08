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
  
}
