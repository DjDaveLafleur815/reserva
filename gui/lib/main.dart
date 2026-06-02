import 'package:flutter/material.dart';
import 'router.dart';

void main() {
  runApp(const ReservaApp());
}

class ReservaApp extends StatelessWidget {
  const ReservaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Réserva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
