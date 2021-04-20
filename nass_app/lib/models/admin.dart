import 'package:flutter/cupertino.dart';

class Admin {
  // Amount of storage available for new users.
  num userStorage;
  // syncTime is used to represent the amount of hours that have to pass until next client-server sync request
  num syncTime;

  Admin({@required this.userStorage, @required this.syncTime});

  Admin.map(Map<String, dynamic> parsedJson)
      : userStorage = parsedJson["espacioUsuarios"],
        syncTime = parsedJson["frecuenciaSync"];

  Admin.empty()
      : userStorage = 0,
        syncTime = 0;
}
