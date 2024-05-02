import 'src/shared/constantes.dart';
import 'src/shared/rutas.dart';
import 'src/shared/not_found.dart';
import 'package:flutter/material.dart';
import '../src/models/colors.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';

void main() async {
  final appDb = AppDb();
  await appDb.fillViviendaUbicacion();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iniciar Viviendas Módicas',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: CustomColor.cVerde,
      ),
      initialRoute: Rutas.inicioSesion.name,
      routes: rutas,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const NotFound();
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }
}