class ImageModel {
  String imageUrl, nombre, creado, tipo;

  ImageModel.map(Map<String, dynamic> parsedJson)
      : imageUrl = parsedJson['Image'],
        nombre = parsedJson['nombre'],
        creado = parsedJson['upload_date'],
        tipo = parsedJson['type'];
}
