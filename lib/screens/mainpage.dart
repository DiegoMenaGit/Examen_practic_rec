import 'package:examen_practic/screens/crear.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/db_provider.dart';
import '../preferences/usuarios_list_provider.dart';
import '../widgets/scan_tile.dart';

/* En si la pagina se mantiene en el mismo estado, por eso es stateless,
solo cambia el añadido de información del ListViewBuilder que de declara
en el body de la misma */

class HomeScreen extends StatelessWidget {
  //pagina principal on es veuran tots els listiles
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<UsuariosListProvider>(context, listen: false)
                  .esborraTots();
            },
          ),
          IconButton(
            icon: Icon(Icons
                .add), // Introduce un usuario rapidamente para hacer Pruebas
            onPressed: () {
              Provider.of<UsuariosListProvider>(context, listen: false).nouScan(
                  "joan",
                  "joan@gmail.com",
                  "Sa Pobla",
                  "555222333",
                  "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
            },
          ),
          IconButton(
            icon: Icon(Icons.more),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrearPage()),
              );
            },
          ),
        ],
      ),
      body: _HomeScreenBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userlistProvider =
        Provider.of<UsuariosListProvider>(context, listen: true);

    DBProvider.db.database;
    userlistProvider.carregaScans();
    return UsuarisTiles(); // Aqui se llama a cada tile que se ha creado y la enseña en el body
  }
}
