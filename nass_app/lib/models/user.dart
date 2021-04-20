class User {
  String nombre;
  num usado,
      disponible,
      usadoImg,
      usadoVideo,
      usadoDoc,
      userStorage = 0,
      userSync = 0;
  bool admin = false;

  User.map(Map<String, dynamic> parsedJson)
      : nombre = parsedJson["nombre"],
        usado = parsedJson["usado"] as num,
        disponible = parsedJson["disponible"] as num,
        usadoImg = parsedJson["usadoImg"] as num,
        usadoVideo = parsedJson["usadoVideo"] as num,
        usadoDoc = parsedJson["usadoDoc"] as num;

  User.adminMap(Map<String, dynamic> parsedJson)
      : nombre = parsedJson["nombre"],
        usado = parsedJson["usado"] as num,
        disponible = parsedJson["disponible"] as num,
        usadoImg = parsedJson["usadoImg"] as num,
        usadoVideo = parsedJson["usadoVideo"] as num,
        usadoDoc = parsedJson["usadoDoc"] as num,
        admin = parsedJson["admin"],
        userStorage = parsedJson["userStorage"],
        userSync = parsedJson["userSync"];

  User.empty()
      : nombre = "",
        usado = 0,
        disponible = 0,
        usadoImg = 0,
        usadoVideo = 0,
        usadoDoc = 0;
}
