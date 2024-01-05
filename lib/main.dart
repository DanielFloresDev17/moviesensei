//Importar primero los paquetes de Dart
//Luego los de Material o Flutter en general
//Seguido de los paquetes de terceros
//Por último nuestras dependencias
import 'package:flutter/material.dart';
import 'package:moviesensei/config/router/app_router.dart';
import 'package:moviesensei/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
