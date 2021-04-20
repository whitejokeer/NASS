import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nass_app/config/config.dart';
import 'package:nass_app/controllers/provider_handler.dart';
import 'package:nass_app/ui/widgets/soft_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminCard extends StatefulWidget {
  @override
  _AdminCardState createState() => _AdminCardState();
}

class _AdminCardState extends State<AdminCard> {
  final formKey = new GlobalKey<FormState>();

  TextEditingController _userStorage = TextEditingController();
  TextEditingController _userSync = TextEditingController();

  @override
  void initState() {
    getValues();
    super.initState();
  }

  getValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userStorage =
          TextEditingController(text: prefs.getString("userStorage"));
      _userSync = TextEditingController(text: prefs.getString("userSync"));
    });
  }

  @override
  Widget build(BuildContext context) {
    final userStorage = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Almacenamiento"),
          SizedBox(
            width: 8.0,
          ),
          Container(
            width: 40.0,
            height: 40.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              autofocus: false,
              validator: (val) {
                return null;
              },
              controller: _userStorage,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );

    final userSync = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Frecuencia Sync"),
          SizedBox(
            width: 8.0,
          ),
          Container(
            width: 40.0,
            height: 40.0,
            child: TextFormField(
              keyboardType: TextInputType.number,
              autofocus: false,
              validator: (val) {
                return null;
              },
              controller: _userSync,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
    return SoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Administración",
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontSize: MediaQuery.of(context).size.width < appSizeConstrain
                    ? 20
                    : 25.0),
          ),
          SizedBox(
            height: 8,
          ),
          Form(
            key: formKey,
            child: Wrap(
              spacing: 16.0,
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 16.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                userStorage,
                userSync,
                TextButton(
                  onPressed: () async {
                    final form = formKey.currentState;
                    form.save();
                    if (_userSync.text != "" && _userStorage.text != "") {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            content: Container(
                              height: 100.0,
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      await context
                          .read(adminControllerProvider)
                          .changeAdminParameters(num.parse(_userStorage.text),
                              num.parse(_userSync.text))
                          .then((value) {
                        if (value) {
                          Navigator.pop(context);
                          showDialog<void>(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                content: Container(
                                  height: 100.0,
                                  child: Center(
                                    child: Text(
                                      "Se actualizo la información satisfactoriamente",
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        "Entendido",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: Text('Ups'),
                                content: Text(
                                    'Algo ha ido mal!.\nVuelve a intentarlo dentro de unos minutos'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        "Entendido",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    } else {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        // false = user must tap button, true = tap outside dialog
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: Text('Ups'),
                            content: Text(
                              'Lo sentimos, los campos de Almacenamiento y Frecuencia Sync no pueden ser 0.\nVuelve a intentarlo',
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    "Entendido",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).primaryColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Guardar",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
