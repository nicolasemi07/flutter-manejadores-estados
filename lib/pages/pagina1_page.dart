import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () { usuarioCubit.borrarUsuario(); }),
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
 
      builder: (_, state) {

        // print(state);

        switch (state.runtimeType) {
          case UsuarioInitial:
              return Center(child: Text('No existe información de usuario'));
            break;
          case UsuarioActivo:
              return InformacionUsuario((state as UsuarioActivo).usuario);
            break;
          default:
              return Center(child: Text('Estado no reconocido'));
        }


        // if (state is UsuarioInitial) { // Esto se hace porque si el estado es una instancia de "usuario inicial" es porque no hay usuario
        //   return Center(child: Text('No existe información de usuario'));
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // } else {
        //   return Center(child: Text('Estado no reconocido'));
        // }

      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          
          ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList()
        ],
      ),
    );
  }
}
