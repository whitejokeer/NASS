import 'package:flutter/material.dart';
import 'package:nass_app/ui/widgets/soft_card.dart';

class AddFileCard extends StatefulWidget {
  @override
  _AddFileCardState createState() => _AddFileCardState();
}

class _AddFileCardState extends State<AddFileCard> {
  TextEditingController _nombre = TextEditingController();
  String _type;
  List<String> _typeOptions = ['Imagen', 'Video', 'Documento'];

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
                width: 280,
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
    return Container(
      height: 310.0,
      width: 350.0,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SoftCard(
              width: 130.0,
              height: 150.0,
              child: Center(
                child: Icon(
                  Icons.library_add_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 50.0,
                ),
              ),
            ),
          ),
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
          )
        ],
      ),
    );
  }
}
