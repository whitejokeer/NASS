import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nass_app/models/fileData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileDataController extends StateNotifier<List<FileData>> {
  FileDataController() : super([]);

  getData(String type) {
    if (state.isEmpty) {
      if (type == "img") {
        state = [
          FileData(
            uploaded: true,
            fileUrl:
                "https://www.purina-latam.com/sites/g/files/auxxlc391/files/styles/social_share_large/public/purina-por-que-vemos-tan-felices-a-los-gatos-en-cajas-de-carton.png?itok=xABhZ8v9",
            nombre: "Gato Lindo",
            creado: DateTime.parse("2021-04-19 19:45:35"),
            owner: "Jairo Sánchez",
            peso: 371,
            tipo: "img",
          ),
          FileData(
            uploaded: true,
            fileUrl:
                "https://www.purina-latam.com/sites/g/files/auxxlc391/files/styles/social_share_large/public/purina-por-que-vemos-tan-felices-a-los-gatos-en-cajas-de-carton.png?itok=xABhZ8v9",
            nombre: "Gato Lindo",
            creado: DateTime.parse("2021-04-19 19:45:35"),
            owner: "Jairo Sánchez",
            peso: 371,
            tipo: "img",
          ),
        ];
        return state;
      } else if (type == "video") {
        state = [
          FileData(
            uploaded: true,
            fileUrl:
                "https://firebasestorage.googleapis.com/v0/b/nass-f6620.appspot.com/o/y2mate.com%20-%20State%20Management%20Like%20A%20Pro%20%20Flutter%20Riverpod_480p.mp4?alt=media&token=ab3ecfb9-c2a9-4a44-9d89-95286e3a8510",
            nombre: "Gato Lindo",
            creado: DateTime.parse("2021-04-19 19:45:35"),
            owner: "Jairo Sánchez",
            peso: 21.41,
            tipo: "video",
          ),
          FileData(
            uploaded: true,
            fileUrl:
                "https://firebasestorage.googleapis.com/v0/b/nass-f6620.appspot.com/o/y2mate.com%20-%20State%20Management%20Like%20A%20Pro%20%20Flutter%20Riverpod_480p.mp4?alt=media&token=ab3ecfb9-c2a9-4a44-9d89-95286e3a8510",
            nombre: "Gato Lindo",
            creado: DateTime.parse("2021-04-19 19:45:35"),
            owner: "Jairo Sánchez",
            peso: 21.41,
            tipo: "video",
          ),
        ];
        return state;
      } else {
        state = [
          FileData(
            uploaded: true,
            fileUrl:
                "https://firebasestorage.googleapis.com/v0/b/nass-f6620.appspot.com/o/y2mate.com%20-%20State%20Management%20Like%20A%20Pro%20%20Flutter%20Riverpod_480p.mp4?alt=media&token=ab3ecfb9-c2a9-4a44-9d89-95286e3a8510",
            nombre: "Gato Lindo",
            creado: DateTime.parse("2021-04-19 19:45:35"),
            owner: "Jairo Sánchez",
            peso: 1.41,
            tipo: "doc",
          ),
          FileData(
            uploaded: true,
            fileUrl:
                "https://firebasestorage.googleapis.com/v0/b/nass-f6620.appspot.com/o/y2mate.com%20-%20State%20Management%20Like%20A%20Pro%20%20Flutter%20Riverpod_480p.mp4?alt=media&token=ab3ecfb9-c2a9-4a44-9d89-95286e3a8510",
            nombre: "Gato Lindo",
            creado: DateTime.parse("2021-04-19 19:45:35"),
            owner: "Jairo Sánchez",
            peso: 1.41,
            tipo: "doc",
          ),
        ];
        return state;
      }
    } else {
      return state;
    }
  }

  Future<bool> addImage(
      {@required File fileData,
      @required String nombre,
      @required String currentType,
      @required int fileSize}) async {
    bool done;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String _tipo;

    if (currentType == "Imagen") {
      _tipo = "img";
    } else if (currentType == "Video") {
      _tipo = "video";
    } else {
      _tipo = "doc";
    }

    FileData _file = FileData(
      fileUrl: fileData.path,
      nombre: nombre,
      creado: DateTime.now(),
      owner: prefs.getString("userName"),
      peso: fileSize,
      tipo: _tipo,
      uploaded: true,
    );

    state = [...state, _file];
    done = true;

    return done;
  }

  Future<bool> deleteImage(FileData fileData, String currentTypeView) async {
    bool done;
    // Endpoint Consume space

    // -------------------
    if (currentTypeView == fileData.tipo) {
      state.remove(fileData);
    }

    return done;
  }
}
