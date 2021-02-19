import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Si se pone el "listen: false" es porque no puede redibujar widget dentro del método
    final usuarioService = Provider.of<UsuarioService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text('${usuarioService.usuario.nombre}')
            : Text('Página 2'),
      ),
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
                final newUser = new Usuario(
                    nombre: 'Nicolas',
                    edad: 28,
                    profesiones: ['Fullstack dev', 'Engineer', 'Baller']);

                usuarioService.usuario = newUser;
              },
            ),
            MaterialButton(
              child:
                  Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(33);
              },
            ),
            MaterialButton(
              child: Text('Añadir profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
