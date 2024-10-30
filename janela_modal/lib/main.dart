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
  void _navegacaosegundapagina() {
    //criamos função de navegação para a proxima pagina
    showDialog(
        // aqui criamos a janela mudal usando showdialog
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // alertdialog armazena o conteudo da janela modal
            title: const Text("Confirme a navegação para a proxima pagina"),

            actions: [
              //actions armazena os botoes e suas funcoes
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); //pop fecha a janela modal caso o usuario recuse
                },
                style: TextButton.styleFrom(
                  //usamos style para definir uma cor personalizada ao botao
                  foregroundColor:
                      Colors.red, //   foregroundColor armazena a cor desejada
                ),
                child: const Text("recusar navegação"),
              ),
              //aba função do botao caso o usuario aceite a navegação
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // pop fecha a janela caso o usuario aceite
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SegundaJanela()), // faz a navegação para a proxima janela
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                ),
                child: const Text("confirmar"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        //drawer adiciona o menu lateral a pagina
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Menu Lateral'),
            ),
            ListTile(
              // usei listtile para adicionar o botão ao drawer
              leading: const Icon(Icons.arrow_forward), //define o icone da seta
              title: const Text(
                  'Ir para a próxima página'), //adiciona o texto ao drawer
              onTap:
                  _navegacaosegundapagina, //puxamis a função para fazer a navegação
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Clique no botão do menu lateral para ir para a próxima página',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
