import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
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
                final newUser = new Usuario(nombre: 'Nicolas', edad: 27, profesiones: ['Fullstack dev', 'Entrepreneur']);
                usuarioBloc.add(ActivarUsuario(newUser));
              },
            ),
            MaterialButton(
              child:
                  Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(CambiarEdad(30));
              },
            ),
            MaterialButton(
              child: Text('Añadir profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(AgregarProfesion('Profesion X'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
