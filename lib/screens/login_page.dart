import 'package:examen_practic/screens/mainpage.dart';
import 'package:flutter/material.dart';

import '../preferences/preferences.dart';

/* Es un stateful Widget con un estado ya que
el sharedPreferences necesita guardar la información
una vez se le de al checkbox */

class LoginPage extends StatefulWidget {
  // pantalla donde se meten los datos para el preferences
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  //var nouemail = "";
  //var noucontra = "";
  var arrcontra = Preferencias
      .pass; // las variables reciben su estado del shared preferences
  var arrcheck = Preferencias.diablo;
  var arremail = Preferencias.email;
  RegExp emailRegExp =
      new RegExp(r'^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
  RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Usuario"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          // todos los input para preferences
          children: <Widget>[
            TextFormField(
              initialValue: Preferencias.email,
              decoration: InputDecoration(
                labelText: "Email",
              ),
              onChanged: (value) {
                //nouemail = value;
                arremail = value;
              },
            ),
            TextFormField(
              initialValue: Preferencias.pass,
              decoration: InputDecoration(
                labelText: "Contraseña",
              ),
              onChanged: (value) {
                //noucontra = value;
                arrcontra = value;
              },
              obscureText: true,
            ),
            CheckboxListTile(
                value: Preferencias.diablo,
                title: Text('Recordar'),
                onChanged: (value) {
                  Preferencias.setdiablo = value!;
                  arrcheck = value;
                  setState(() {});
                }),
            IconButton(
              onPressed: () {
                if (arrcheck) {
                  Preferencias.setpass = arrcontra;
                  Preferencias.setemail = arremail;
                  // Preferencias.setpass = noucontra;
                  // Preferencias.setemail = nouemail;
                  setState(() {});
                }
                if (arrcontra.length >= 5) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  const snackBar = SnackBar(
                    content: Text('Contraseña muy corta!!'),
                  );
                }
              },
              icon: Icon(
                Icons.arrow_forward,
                size: 42.0,
                color: Colors.blue[800],
              ),
            )
          ],
        ),
      ),
    );
  }
}
