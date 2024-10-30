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
  void _navegacaosegundapagina() { //criamos função de navegação para a proxima pagina
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SegundaJanela()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer( //drawer adiciona o menu lateral a pagina
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Menu Lateral'),   
            ),
            ListTile( // usei listtile para adicionar o botão ao drawer 
              leading: const Icon(Icons.arrow_forward), //define o icone da seta
              title: const Text('Ir para a próxima página'), //adiciona o texto ao drawer
              onTap: _navegacaosegundapagina, //puxamis a função para fazer a navegação
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Clique no botão do menu lateral para ir para a próxima página'),
          ],
        ),
      ),
    );
  }
}
