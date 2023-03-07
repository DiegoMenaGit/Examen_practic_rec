import 'package:examen_practic/preferences/preferences.dart';
import 'package:examen_practic/preferences/usuarios_list_provider.dart';
import 'package:examen_practic/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Clase main que inicializa los privider y pone
como pagina principal al LogIn */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferencias.init();
  runApp(
    // clase principal para iniciar la app
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UsuariosListProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // rutas y debug en false
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: HomePage(),
      initialRoute: 'home',
      routes: {'home': (_) => LoginPage()},
    );
  }
}
