import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/usuarios_list_provider.dart';
import '../screens/persona.dart';

/*He usado un StatefulWidget con un State de Cada ListTile
Antes lo tenia declarado como un StatelessWidget ya que no
habia cambios en si en la ventana pero luego he comenzado a 
tener problemas con el metodo dissmisable y lo he cambiado a
stateful widget por si las moscas
*/

class UsuarisTiles extends StatefulWidget {
  @override
  _UsuarisTilesState createState() => _UsuarisTilesState();
}

class _UsuarisTilesState extends State<UsuarisTiles> {
  //const _UsuarisTilesState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuariListProvider = Provider.of<UsuariosListProvider>(context);
    final scans = usuariListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          // he usado el Gesture Detecor por una incompatibilidad que encontraba al realizar las pruebas
          onTap: () {
            // al darle click a las list tile saldrán los detelles de estas, redirigiendote a otra pantalla
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Persona()),
            );
          },
          child: Dismissible(
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
              (DismissDirection direction) {
                Provider.of<UsuariosListProvider>(context, listen: false)
                    .esborraPerid(scans[index]
                        .id!); // borra segun la id declarada al crear el list tile (index) y la id del propio usuario cuando se crea
              };
            },
            child: ListTile(
              // Este listTile enseña el nombre y el email de cada usuario, a partir de la lista de usuarios (scans), ademas de un icono
              leading: Icon(
                Icons.face,
              ),
              title: Text(scans[index].name),
              subtitle: Text(scans[index].email),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
