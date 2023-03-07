import 'package:examen_practic/preferences/usuarios_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/usuarios_list_provider.dart';

/* He hecho que esta pantalla sea un statelessWidget
porque solo se actualiza cuando se añado otro usuario,
en la pestaña de crear*/

class PersonaInfo extends StatelessWidget {
  // aqui es mostraran els listile de cada persona quan es cliqui damunt
  const PersonaInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuariListProvider = Provider.of<UsuariosListProvider>(context);
    final scans = usuariListProvider.scans;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var scan in scans)
            Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.delete_forever),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              onDismissed: (DismissDirection direccio) {
                Provider.of<UsuariosListProvider>(context, listen: false)
                    .esborraPerid(scan.id!);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      scan.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Email: ${scan.email}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Address: ${scan.address}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Phone: ${scan.phone}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Image(
                      image: NetworkImage("${scan.photo}"),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
