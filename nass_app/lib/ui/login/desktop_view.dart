import 'package:flutter/material.dart';
import 'package:nass_app/controllers/authentication_controller.dart';
import 'package:nass_app/ui/widgets/soft_card.dart';

class DesktopView extends StatefulWidget {
  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  final formKey = new GlobalKey<FormState>();
  AuthenticationController _controller = AuthenticationController();

  String _correo, _contrasena;

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email no valido';
    } else {
      return null;
    }
  }

  loginRequest() async {
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
      await _controller.loginRequest(_correo, _contrasena).then((value) {
        if (value) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pop(context);
          print("no se pudo");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Container(
      child: Image.asset("assets/cloud_illustration.png"),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: emailValidator,
      onSaved: (val) => _correo = val,
      decoration: InputDecoration(
        hintText: 'Correo',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (val) {
        return val.isEmpty ? "Este campo es obligatorio" : null;
      },
      onSaved: (val) => _contrasena = val,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );

    final loginButton = Padding(
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
              onPressed: loginRequest,
              child: Text('INGRESAR',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ),
      ),
    );

    final registarLabel = Container(
      alignment: Alignment.center,
      child: TextButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No tienes cuenta? ',
              style: TextStyle(color: Colors.black54),
            ),
            Text(
              'Registrate',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        onPressed: () => Navigator.of(context).pushNamed("/register"),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: SoftCard(
        height: 500,
        width: 950,
        child: Row(
          children: [
            Flexible(
              child: Center(child: logo),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "NASS",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              letterSpacing: 3.0,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 64.0,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          email,
                          SizedBox(height: 8.0),
                          password,
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                    loginButton,
                    registarLabel
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
