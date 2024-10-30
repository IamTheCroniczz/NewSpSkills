import 'package:flutter/material.dart';

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
        primarySwatch: Colors
            .orange, //usamos primarySwatch para definin a cor principal como laranja
        scaffoldBackgroundColor: const Color.fromARGB(255, 44, 44,
            44), // o scaffold é usado para definir a cor de fundo que nesse caso é preto
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors
                .orange //aqui damos prioridade para que a cor da appBar se mantenha laranja

            ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.orange, // Define a cor do botao como laranja
        ),
      ),
      home: const MyHomePage(title: 'Modelo de mudança de tema'),
    );
  }
}

// a class sempre vai definir a funcionalidade do widget
// StatefulWidget indica que após a interação muda o estado da pagina
class MyHomePage extends StatefulWidget {
// const myhomepage garante que o titulo nao seja mudado enquanto o widget estiver em uso
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  //CreateState atribui o estádo mutavel a nova classe "_myhomepagestate"
  //a nova classe com o estado atribuida nao precisa ter um nome que combine com a classe criada anteriormente
  State<MyHomePage> createState() =>
      _MyHomePageState(); //o underline na classe significa que ele é privado ao arquivo em que está definido
}

//aqui indicamos que myhomepagestate pode alterar o estado de myhomepage
class _MyHomePageState extends State<MyHomePage> {
  //aqui declaramos uma nova variavel que indica o valor inicial do contador
  //lembre-se de que por conter o underline se torna uma variavel privada
  int _counter = 0;
  //criamos uma variavel para armazenar a cor original do botao
  Color corbotao = Colors.orange;

  void _incrementCounter() {
    //void define um metodo vazio ou seja, que nao retorna nada, por isso "void"
    setState(() {
      //setstate notifica que o estado foi alterado e que a interface tem que ser reconstruida
      // dentro dos parentes contém um callback anonimo que possui o código para alterar a pagina
      _counter++; //adicionamos o operador de incremento "++" que aumenta o valor da variavel
     corbotao = Colors.red; //nova variavel com a cor de mudança do botao
     
    });
 // aqui vemos um método que cria uma duração para a ação futura, que no caso é a mudança de cor do botão
   Future.delayed(const Duration(milliseconds: 300), (){ //definimos quanto tempo dura essa alteração, nesse caso 0,3 segundos
     // o const nesse caso não é obrigatorio, seria mais como uma boa prática 
    
     
    setState(() {
      corbotao = Colors.orange; // definimos qual cor o botão retornaria
    });
   });
     
    

   
   
  
  }

//usar o "@override" informa que estamos modificando o comportamento de um método
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: corbotao, //aplicamos a cor do botão
        child: const Icon(Icons.add),
      ),
    );
  }
}
