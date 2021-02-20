import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {

  // BLOC: Bussiness Logic Object Component
  // El BLOC recibe eventos y cambia el estado (recibe 'events' y cambia 'states')

  UsuarioBloc():super(UsuarioState());

  // El "async*" dice que va a retornar un Stream en lugar de un Future. El YIELD se usa en lugar del RETURN por el tipo de retorno
  // (ésta es una función generadora)
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {

    if (event is ActivarUsuario) {
      // yield UsuarioState(user: event.usuario);
      yield state.copyWith(usuario: event.usuario);

    } else if (event is CambiarEdad) {
      // yield UsuarioState(user: state.usuario.copyWith(edad: event.edad));
      yield state.copyWith(usuario: state.usuario.copyWith(edad: event.edad));

    } else if (event is AgregarProfesion) {
      final profesionesSobreescribir = state.usuario.profesiones;
      profesionesSobreescribir.add(event.profesion);
      // yield UsuarioState(user: state.usuario.copyWith(profesiones: profesionesSobreescribir));
      yield state.copyWith(usuario: state.usuario.copyWith(profesiones: profesionesSobreescribir));

    } else if (event is BorrarUsuario) {
      // yield UsuarioState();
      yield state.estadoInicial();
    }

  }

}
