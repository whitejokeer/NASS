import 'package:flutter/widgets.dart';

class FileData {
  String fileUrl, nombre, tipo, owner;
  DateTime creado;
  // El peso se muestra en KiloBytes
  num peso;

  FileData({
    @required this.fileUrl,
    @required this.nombre,
    @required this.creado,
    @required this.owner,
    @required this.peso,
    @required this.tipo,
  });

  FileData.map(Map<String, dynamic> parsedJson)
      : fileUrl = parsedJson['fileUrl'],
        nombre = parsedJson['nombre'],
        creado = DateTime.parse(parsedJson['upload_date'] as String),
        owner = parsedJson['owner'],
        tipo = parsedJson['tipo'],
        peso = parsedJson['peso'] as num;
}
