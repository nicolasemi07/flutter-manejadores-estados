import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:estados/pages/pagina1_page.dart';
import 'package:estados/pages/pagina2_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UsuarioService(),
          // lazy: false, // Levanta la instancia de UsuarioService apenas arranca la app
          // lazy: true // Levanta la instancia de UsuarioService apenas es requerida (valor por defecto)
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page(),
        },
      ),
    );
  }
}
