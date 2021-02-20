part of 'usuario_bloc.dart';

class UsuarioState {
  final bool existeUsuario;
  final Usuario usuario;

  // CONSTRUCTOR que asigna propiedad Usuario y ExisteUsuario en base a si viene o no por parámetro
  UsuarioState({Usuario user})
      : usuario = user ?? null,
        existeUsuario = (user != null) ? true : false;

  UsuarioState copyWith({Usuario usuario}) => UsuarioState(user: usuario ?? this.usuario);

  UsuarioState estadoInicial() => UsuarioState();
}
