import 'package:flutter/material.dart';
import 'package:nass_app/controllers/authentication_controller.dart';

import '../../config/colors.dart';
import '../widgets/soft_card.dart';

class RegisterDesktopView extends StatefulWidget {
  @override
  _RegisterDesktopViewState createState() => _RegisterDesktopViewState();
}

class _RegisterDesktopViewState extends State<RegisterDesktopView> {
  final formKey = new GlobalKey<FormState>();
  AuthenticationController _controller = AuthenticationController();

  String _email, _password, _nombre;

  TextEditingController passwordController = TextEditingController();

  register() async {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            content: Container(
              height: 100.0,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          );
        },
      );
      await _controller
          .registerRequest(_email, _password, _nombre)
          .then((value) {
        if (value) {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pop(context);
          print("no se pudo");
        }
      });
    }
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Correo invalido';
    } else {
      return null;
    }
  }

  String pwdValidator1(String value) {
    if (value.length < 6) {
      return 'La Contraseña debe tener minimo 6 caracteres';
    } else {
      return null;
    }
  }

  String pwdValidator2(String value) {
    if (value != passwordController.text) {
      return "Las contraseñas no coinciden";
    } else if (value.length < 6) {
      return 'La Contraseña debe tener minimo 6 caracteres';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: colorHookers,
          size: 40.0,
        ),
      ),
      title: Text("Registrate", style: Theme.of(context).textTheme.headline4),
    );

    final nombre = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        autofocus: false,
        validator: (val) {
          return val.isEmpty ? "Este campo es obligatorio" : null;
        },
        onSaved: (val) => _nombre = val,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'Nombre',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
      ),
    );

    final correo = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        validator: emailValidator,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        onSaved: (val) => _email = val,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          labelText: 'Correo',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
      ),
    );

    final contrasena = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        autofocus: false,
        obscureText: true,
        validator: pwdValidator1,
        controller: passwordController,
        onSaved: (val) => _password = val,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          labelText: 'Contraseña',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
      ),
    );

    final contrasena2 = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        autofocus: false,
        obscureText: true,
        validator: pwdValidator2,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: 'Verificar Contraseña',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
      ),
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding: EdgeInsets.all(0.0),
            color: Theme.of(context).primaryColor,
            child: MaterialButton(
              minWidth: 200.0,
              height: 55.0,
              onPressed: register,
              child: Text('Registrarse'.toUpperCase(),
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SoftCard(
              width: 400.0,
              height: 550.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        nombre,
                        correo,
                        contrasena,
                        contrasena2,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  registerButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
