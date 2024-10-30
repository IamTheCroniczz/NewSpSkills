//nessa pagina criamos a nova janela
import 'package:flutter/material.dart'; // aqui Importamos todos os recursos do Flutter


class SegundaJanela extends StatelessWidget {
  const SegundaJanela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda página'),
      ),
      body: Center( //usamos center para manter o botão centralizado ao meio da pagina
        child: ElevatedButton(
          onPressed: () {
            showDialog(// aqui criamos a janela mudal usando showdialog
              context: context,
              builder: (BuildContext context) {
                return AlertDialog( // alertdialog armazena o conteudo da janela modal
                  title:
                      const Text("Confirme a navegação para voltar a pagina original"),
                  actions: [//actions armazena os botoes e suas funcoes
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha a janela caso o usuario recuse
                      },
                      style: TextButton.styleFrom(//usamos style para definir uma cor personalizada ao botao
                        foregroundColor: Colors.red), //   foregroundColor armazena a cor desejada
                      child: const Text("Recusar Navegação"),
                    ),
                    TextButton(//aba função do botao caso o usuario aceite a navegação
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha a janela caso o usuario aceite
                        Navigator.pop(context); // Volta para a página inicial
                      },
                      style:
                          TextButton.styleFrom(
                            foregroundColor: Colors.green),
                      child: const Text("Confirmar"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Voltar para a página inicial'),
        ),
      ),
    );
  }
}
