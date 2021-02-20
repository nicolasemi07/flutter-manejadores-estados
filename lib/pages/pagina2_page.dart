import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);
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
                usuarioCubit.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              child:
                  Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(40);
              },
            ),
            MaterialButton(
              child: Text('Añadir profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
