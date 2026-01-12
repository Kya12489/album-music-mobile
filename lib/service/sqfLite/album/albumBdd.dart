import 'package:sqflite/sqflite.dart';
import 'package:tp2/service/sqfLite/connexion.dart';

class AlbumBdd {
  String nomBdd = "Favorie";
  Future<Database> get albumBdd => ConnexionBdd.openMyDatabase(nomBdd, 
  (db,version) async{
    await db.execute('''
          CREATE TABLE $nomBdd (
            id INTEGER PRIMARY KEY
          )
          ''');
  });

  Future<void> addFavorite(int albumId) async {
    try {
      final db = await albumBdd;
      await db.insert(
        nomBdd,
        {'id': albumId},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Erreur lors de l\'ajout aux favoris : $e');
    }
    
  }

  Future<void> removeFavorite(int albumId) async {
    try {
      final db = await albumBdd;
      await db.delete(
        nomBdd,
        where: 'id = ?',
        whereArgs: [albumId],
      );
    } catch (e) {
      print('Erreur lors de la suppression des favoris : $e');
    }
  }
}