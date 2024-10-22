import 'package:flutter/material.dart';
import 'novajanela.dart'; // Importei o arquivo da segunda página

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 44, 44, 44),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.orange),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
      ),
      home: const MyHomePage(title: 'Modelo de navegação'),
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
  // Declara a nova variável para armazenar a cor do botão
  Color corbotao = Colors.orange;

  void _navegacaosegundapagina() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SegundaJanela()),
      
    );
    setState(() {
      corbotao = Colors.red;
    });
    // aqui vemos um método que cria uma duração para a ação futura, que no caso é a mudança de cor do botão
    Future.delayed(const Duration(milliseconds: 300), () {
      //definimos quanto tempo dura essa alteração, nesse caso 0,3 segundos
      // o const nesse caso não é obrigatorio, seria mais como uma boa prática

      setState(() {
        corbotao = Colors.orange; // definimos qual cor o botão retornaria
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Clique no botão para ir para a próxima página'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navegacaosegundapagina,
        tooltip: 'Ir para a próxima página',
        backgroundColor: corbotao,
        child: const Icon(Icons.arrow_forward), //modifiquei para que mude o ícone de "+" para a seta
      ),
    );
  }
}
