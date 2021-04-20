import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nass_app/models/fileData.dart';

class FileDataController extends StateNotifier<List<FileData>> {
  FileDataController() : super([]);

  getData(String type) {
    if (type == "img") {
      state = [
        FileData(
          fileUrl:
              "https://www.purina-latam.com/sites/g/files/auxxlc391/files/styles/social_share_large/public/purina-por-que-vemos-tan-felices-a-los-gatos-en-cajas-de-carton.png?itok=xABhZ8v9",
          nombre: "Gato Lindo",
          creado: DateTime.parse("2021-04-19 19:45:35"),
          owner: "Jairo Sánchez",
          peso: 371,
          tipo: "img",
        ),
        FileData(
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
          fileUrl:
              "https://firebasestorage.googleapis.com/v0/b/nass-f6620.appspot.com/o/y2mate.com%20-%20State%20Management%20Like%20A%20Pro%20%20Flutter%20Riverpod_480p.mp4?alt=media&token=ab3ecfb9-c2a9-4a44-9d89-95286e3a8510",
          nombre: "Gato Lindo",
          creado: DateTime.parse("2021-04-19 19:45:35"),
          owner: "Jairo Sánchez",
          peso: 21.41,
          tipo: "video",
        ),
        FileData(
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
          fileUrl:
              "https://firebasestorage.googleapis.com/v0/b/nass-f6620.appspot.com/o/y2mate.com%20-%20State%20Management%20Like%20A%20Pro%20%20Flutter%20Riverpod_480p.mp4?alt=media&token=ab3ecfb9-c2a9-4a44-9d89-95286e3a8510",
          nombre: "Gato Lindo",
          creado: DateTime.parse("2021-04-19 19:45:35"),
          owner: "Jairo Sánchez",
          peso: 1.41,
          tipo: "doc",
        ),
        FileData(
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
  }

  Future<bool> addImage(FileData fileData, String currentTypeView) async {
    bool done;
    // Endpoint Consume space

    // -------------------
    if (currentTypeView == fileData.tipo) {
      state = [...state, fileData];
    }

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
