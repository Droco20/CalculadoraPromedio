import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Notas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.white70,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de Notas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _promedio = 0.0; // Variable para el promedio
  final _nota1 = TextEditingController();
  final _nota2 = TextEditingController();
  final _nota3 = TextEditingController();
  final _nota4 = TextEditingController();

  void _calcular() {
    setState(() {
      double nota1 = double.parse(_nota1.text);
      double nota2 = double.parse(_nota2.text);
      double nota3 = double.parse(_nota3.text);
      double nota4 = double.parse(_nota4.text);
      double promedio = (nota1 + nota2 + nota3 + nota4) / 4;

      _promedio = promedio; // Actualiza el promedio

      // Calcula el promedio y muestra un mensaje en función del resultado
      if (promedio >= 3.0) {
        _mostrarResultado("Ganaste la materia");
      } else {
        _mostrarResultado("Perdiste la materia");
      }
    });
  }

  void _mostrarResultado(String mensaje) {
    // Muestra el mensaje en un SnackBar
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensaje)));

    // Llama a la función de reinicio después de 5 segundos
    Future.delayed(Duration(seconds: 5), () {
      _reiniciarApp();
    });
  }

  void _reiniciarApp() {
    setState(() {
      // Reinicia las variables
      _promedio = 0.0;
      _nota1.text = '';
      _nota2.text = '';
      _nota3.text = '';
      _nota4.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true, // Centra el título
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ingresar Notas',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors
                      .blueAccent, // Cambia el color de texto según tus necesidades
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nota1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nota 1",
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextFormField(
                      controller: _nota2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nota 2",
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nota3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nota 3",
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextFormField(
                      controller: _nota4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nota 4",
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _calcular,
                child: const Text("Calcular"),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Promedio de la Nota: $_promedio',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Ctrl + alt + Shif + l = ***INDENTAR EL CODIGO***
