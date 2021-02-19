import 'package:flutter/material.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Página 2'),
          title: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
              ? Text(snapshot.data.nombre)
              : Text('Página 2');
        },
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = new Usuario(nombre: 'Nicolas', edad: 27);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
            ),
            MaterialButton(
              child:
                  Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(28);
              },
            ),
            MaterialButton(
              child: Text('Añadir profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
