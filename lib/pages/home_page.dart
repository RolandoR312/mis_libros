import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    title: _title;
    return Scaffold(
      appBar: AppBar(title: const Text('Sierra Nevada')),
      body: Center(
        child: SelectionArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              const Image(
                image: AssetImage('assets/images/logotype.png'),
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Pais : Colombia \nDepartamento: Magdalena \nCiudad: Santa Marta'
                  '\nTemperatura: 30 °C'
              '\n\n\nLa sierra nevada es un sitio turistico especial para el senderismo, '
                  'avistamiento de aves y en general disfrutar de la naturaleza '),
              const SizedBox(
                height: 50.0,
              ),
              Text('Vive Colombia \nViaja por ella !!!'),
            ],
          ),
        ),
      ),
    );
  }
}
