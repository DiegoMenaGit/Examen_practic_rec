import 'package:examen_practic/preferences/db_provider.dart';
import 'package:flutter/cupertino.dart';

import '../models/Usuarios.dart';

/* Esta clase interactua directamente con la base de datos,
conectando así al usuario y a esta, Puede recoger valores y
darlos, por lo que necesita un changenotifier para que las
ventanas puedan escuchar y recibir los datos */
class UsuariosListProvider extends ChangeNotifier {
  // clase provider per interactuar amb la base de dades, coge cada consulta hecha en db_provider.cart y les añade los valores que pide
  List<Usuaris> scans = [];

  Future<Usuaris> nouScan(String name, String email, String address,
      String phone, String photo) async {
    final nouScan = Usuaris(
        name: name, email: email, address: address, phone: phone, photo: photo);
    final id = await DBProvider.db.insertScan(nouScan);
    nouScan.id = id;
    this.scans.add(nouScan);
    notifyListeners();
    return nouScan;
  }

  carregaScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  carregaScanPerTipus(String name) async {
    final scans = await DBProvider.db.getScanByName(name);
    this.scans = [...scans!];
    notifyListeners();
  }

  esborraTots() async {
    final scans = await DBProvider.db.deleteAllScans();
    this.scans = []; //clear
    notifyListeners();
  }

  esborraPerid(int id) async {
    final scans = await DBProvider.db.deleteScan(id);
    this.scans.removeWhere((element) => element.id == id);

    notifyListeners();
  }
}
