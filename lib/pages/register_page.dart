import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
enum Genre{masculino, femenino}

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();
  String _data = 'Información';
  Genre? _genre = Genre.masculino;
  bool _aventura = false;
  bool _fantasia = false;
  bool _terror = false;
  String buttonMsg ='Fecha de nacimiento';

  DateTime _date = DateTime(2022,1,1);

  void _showSelectDate() async{
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2022, 10),
      firstDate: DateTime(1910, 1),
      lastDate: DateTime(2022, 12),
      helpText: 'Fecha de nacimiento',
    );
    if (newDate != null){
      setState(() {
        _date = newDate;
        buttonMsg = 'Fecha de nacimiento: ${_date.toString()}';
      });
    }
  }

  void _onRegisterButtonClicked(){
    setState(() {
      String genre = 'Masculino';
      if (_genre == Genre.femenino){
        genre = 'Femenino';
      }
      String favoritos = '';
      if (_aventura) favoritos = '$favoritos Aventura';
      if (_fantasia) favoritos = '$favoritos Fantasia';
      if (_terror) favoritos = '$favoritos Terror';

      _data = 'Nombre: ${_name.text} \nCorreo electrónico: ${_email.text} \nGenero: $genre \n'
          'Genero favorito: $favoritos \nFecha de nacimiento: $_date';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Center (
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('assets/images/logotype.png')),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nombre' ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                       border: OutlineInputBorder(), labelText: 'Correo electrónico' ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Contraseña' ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _repPassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Repita Contraseña' ),
                    keyboardType: TextInputType.text,
                  ),
                  Row(
                    children: [
                      Expanded(child: ListTile(
                        title: const Text('Masculino'),
                        leading: Radio<Genre>(
                          value: Genre.masculino,
                          groupValue: _genre,
                          onChanged: (Genre? value){
                            setState(() {
                              _genre = value;
                            });
                          }),
                        ),
                      ),
                      Expanded(child: ListTile(
                        title: const Text('Femenino'),
                        leading: Radio<Genre>(
                            value: Genre.femenino,
                            groupValue: _genre,
                            onChanged: (Genre? value){
                              setState(() {
                                _genre = value;
                              });
                            }),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Generos favoritos',
                    style: TextStyle(fontSize: 20),
                  ),
                  CheckboxListTile(
                    title: const Text('Aventura'),
                    value: _aventura,
                    onChanged: (bool? value){
                      setState(() {
                        _aventura = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Fantasia'),
                    value: _fantasia,
                    onChanged: (bool? value){
                      setState(() {
                        _fantasia = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Terror'),
                    value: _terror,
                    onChanged: (bool? value){
                      setState(() {
                        _terror = value!;
                      });
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: (){
                      _showSelectDate();
                    },
                    child: Text(buttonMsg),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: (){
                      _onRegisterButtonClicked();
                    },
                    child: const Text('Registrarme'),
                  ),
                  Text(
                      _data,
                    style: const TextStyle(
                      fontSize: 12, fontStyle: FontStyle.italic
                    )
                  )
                ],
            ),
          )
        )
      ),
    );
  }
}



