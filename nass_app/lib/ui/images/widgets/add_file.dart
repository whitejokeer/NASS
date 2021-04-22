import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nass_app/controllers/provider_handler.dart';
import 'package:nass_app/ui/widgets/soft_card.dart';

class AddFileCard extends StatefulWidget {
  @override
  _AddFileCardState createState() => _AddFileCardState();
}

class _AddFileCardState extends State<AddFileCard> {
  File fileData;
  TextEditingController _nombre = TextEditingController();
  String _type;
  int fileSize;

  List<String> _typeOptions = ['Imagen', 'Video', 'Documento'];

  pickImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      setState(() {
        fileData = file;
        _nombre = TextEditingController(text: result.files[0].name);
        fileSize = result.files[0].size;
      });
      print(result.files[0].name);
      print(result.files[0].size);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    final typeDropdown = DropdownButton<String>(
      underline: Container(
        color: Colors.transparent,
        height: 0.1,
      ),
      hint: Text("Tipo de archivo"),
      value: _type,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).primaryColor,
      ),
      items: _typeOptions
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
              value: value,
              child: Container(
                width: 220,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(value),
                  ),
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (String selectedValue) {
        setState(() {
          _type = selectedValue;
        });
      },
    );
    return AlertDialog(
      title: Text('Agregar archivo'),
      content: Container(
        height: 330.0,
        width: 350.0,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: TextField(
                controller: _nombre,
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: typeDropdown),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: GestureDetector(
                onTap: pickImage,
                child: SoftCard(
                  width: 130.0,
                  height: 150.0,
                  child: Center(
                    child: fileData != null && _type == "Imagen"
                        ? Image.file(fileData)
                        : fileData != null && _type == "Video"
                            ? Icon(
                                Icons.video_collection_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 80.0,
                              )
                            : fileData != null && _type == "Documento"
                                ? Icon(
                                    Icons.insert_drive_file,
                                    color: Theme.of(context).primaryColor,
                                    size: 80.0,
                                  )
                                : Icon(
                                    Icons.library_add_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: 50.0,
                                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            String ruta;
            if (_type == "Imagen") {
              ruta = "/images";
            } else if (_type == "Video") {
              ruta = "/videos";
            } else {
              ruta = "/docs";
            }
            await context
                .read(fileDataControllerProvider)
                .addImage(
                  nombre: _nombre.text,
                  fileData: fileData,
                  currentType: _type,
                  fileSize: fileSize,
                )
                .then((value) {
              if (value) {
                print(ruta);
                Navigator.pushReplacementNamed(context, ruta);
                Navigator.pop(context);
              }
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              "Crear",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white, fontSize: 18.0),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).primaryColor),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(
              "Cancelar",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white, fontSize: 18.0),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
