import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/persona_info.dart';

/* Conecta el widget de persona con el de scanTile */
class Persona extends StatelessWidget {
  const Persona({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persona'),
      ),
      body: _PersonaScreenBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _PersonaScreenBody extends StatelessWidget {
  const _PersonaScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersonaInfo();
  }
}
