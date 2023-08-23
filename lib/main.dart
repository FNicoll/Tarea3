import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pelis Populares',
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => PrincipalPage(),
        '/Principal': (context) => const HomePage(),
      },
    );
  }
}

class PrincipalPage extends StatelessWidget {
  PrincipalPage({
    super.key,
  });

  final homeController = Get.put(HomeController());
  final pageController = PageController(initialPage: 0);

  showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cerrar Sesión'),
          content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para cerrar la sesión
                // Por ejemplo: llamar a una función de cierre de sesión
                // y luego redirigir al inicio de sesión
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: const Text('Cerrar Sesión'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelis Populares'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
              leading: Icon(Icons.close_outlined),
              title: Text('Salir'),
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context);
                showLogoutConfirmationDialog(
                    context); // Mostrar el cuadro de diálogo al presionar "Cerrar Sesión"
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, index) {
            return const Column(
              children: [
                ListTile(
                  title: Text('July no me ha entregado nada'),
                )
              ],
            );
          }),
    );
  }
}
