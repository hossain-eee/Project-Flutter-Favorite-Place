import 'dart:io';

import 'package:favorite_place_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/* path and path_provider import and alias them by as  */
import 'package:path_provider/path_provider.dart'
    as syspath; // to avoid clash with path
import 'package:path/path.dart' as path;
//import sqlflite package
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  //database create
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'place.db'),
      //create database
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE user_place (id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT )');
  }, version: 1);
  return db;
}

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []);
  //query in database
  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_place');
    final places = data
        .map(
          (row) => Place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
            location: PlaceLocation(
                latitude: row['lat'] as double,
                longitude: row['lng'] as double,
                address: row['address'] as String),
          ),
        )
        .toList();
    state = places;
  }

  //delete operation
  Future<void> deleteData(String id) async {
    final db = await _getDatabase();
    await db.delete(
      'user_place',
      where:
          'id = ?', // Specify the condition for deletion using a WHERE clause
      whereArgs: [id], // Provide the ID as a parameter
    );

    // Update the state to reflect the deletion
    state = state.where((place) => place.id != id).toList();

    print('Deleted data entry with ID: $id');
    print('delete id is $id');
  }

  //take value as list item
  void addPlace(String title, File image, PlaceLocation location) async {
    //sql part
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');
    //provider part
    final newPlace = Place(
      title: title,
      image: copiedImage,
      location: location,
    );
    //called database
    final db = await _getDatabase();
/*    insert data into database
     db.insert(table, values), value is in map format */
    db.insert(
      'user_place',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'lat': newPlace.location.latitude,
        'lng': newPlace.location.longitude,
        'address': newPlace.location.address,
      },
    );
    state = [newPlace, ...state]; // last value taking first place
  }
}

final userPlaceProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>(
    (ref) => UserPlaceNotifier());
