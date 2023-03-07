import 'package:examen_practic/screens/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../preferences/preferences.dart';
import '../preferences/usuarios_list_provider.dart';
import 'screens.dart';

/* Es un statelessWidget porque todo se envia una vez
le has dado al boton, no durante la ejecución de la página */

class CrearPage extends StatelessWidget {
  var nom = "";
  var email = "";
  var address = "";
  var phone = "";
  var photo = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Usuario"),
      ),
      body: Container(
        // imagen de fondo
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
                initialValue: "",
                decoration: InputDecoration(
                  labelText: "Nom",
                ),
                onChanged: (value) {
                  nom = value;
                }),
            TextFormField(
                initialValue: "",
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                onChanged: (value) {
                  email = value;
                }),
            TextFormField(
                initialValue: "",
                decoration: InputDecoration(
                  labelText: "Address",
                ),
                onChanged: (value) {
                  address = value;
                }),
            TextFormField(
                initialValue: "",
                decoration: InputDecoration(
                  labelText: "Phone",
                ),
                onChanged: (value) {
                  phone = value;
                }),
            TextFormField(
                initialValue: "",
                decoration: InputDecoration(
                  labelText: "Photo",
                ),
                onChanged: (value) {
                  photo = value;
                }),
            IconButton(
              onPressed: () {
                // se introducent todos los valores con el metodo de nouScan
                Provider.of<UsuariosListProvider>(context, listen: false)
                    .nouScan(nom, email, address, phone, photo);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
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
