<<<<<<< HEAD
//nessa página cra
=======

>>>>>>> 23845c096ccbf078fc325319f2de8ef15905ae7b
import 'package:flutter/material.dart'; // aqui importamos todos os recursos do flutter


class SegundaJanela extends StatelessWidget {
  const SegundaJanela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda pagina'),
      ),
      body: Center( //usamos center para manter o botão centralizado ao meio da pagina
        child: ElevatedButton(
          onPressed: () { // aqui criamos um botão que carrega a função de voltar para a pagina anterior
            Navigator.pop(context); // Voltar para a página anterior
          },
          child: const Text('Voltar para a página inicial'), //texto do botão 
        ),
      ),
    );
  }
}
