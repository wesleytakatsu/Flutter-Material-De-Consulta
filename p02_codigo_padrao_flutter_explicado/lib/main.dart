//  ESSE É O CÓDIGO MODELO DO FLUTTER
//  EXPLICAREI DE OUTRA FORMA O QUE TEMOS AQUI

//  ESSE PACOTE É RESPONSÁVEL PARA CRIAR AS INTERFACES
//  NO CASO O material.dart CRIA INTERFACES GERAIS COMO ANDROID
import 'package:flutter/material.dart';

//  FUNÇÃO PRINCIPAL QUE INICIA O PROGRAMA
void main() {
  //  SEMPRE USE runApp para iniciar a aplicação. Onde vai chamar a classe que inicia a view.
  runApp(const MyApp());
}

//  ESSE É O CÓDIGO QUE VAI CRIAR A PRIMEIRA TELA
//  CLASSE DO TIPO StatelessWidget É IMUTÁVEL E GERALMENTE
//  SÃO USADAS NA CLASSE PRINCIPAL QUE MONTA A TELA
class MyApp extends StatelessWidget {
  //  DEPENDENDO DA CLASSE, É POR AQUI QUE ELA EXIGE OS PARÂMETROS
  const MyApp({super.key});

  // SENDO OS WIDGETS CLASSES ABSTRATAS, ELAS PRECISAM DO @override
  @override

  //  AQUI VC COMEÇA A MONTAR O WIDGET PRINCIPAL COMO UM "CONTAINER".
  //  NELE VC PRECISA USAR build(BuildContext context)
  Widget build(BuildContext context) {
    //  ESSE RETORNO VOLTA COM TODA A JANELA CRIADA
    return MaterialApp(
      //  O TÍTULO DA JANELA, NÃO VISTA NO CELULAR
      title: 'Flutter Demo',
      //  TEM O TEMA COM A COR DE FUNDO AZUL
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //  O OUTRO PARÂMETRO É O home: QUE RECEBE A CLASSE MyHomePage
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
//  UMA CLASSE DO TIPO StatefulWidget TEM ESTADO MUTÁVEL
//  StatefulWidget É O RESPONSÁVEL POR GERENCIAR O ESTADO DO WIDGET E  RESPONSÁVEL
//  POR RECONSTRUIR O WIDGET QUANDO O ESTADO MUDA
class MyHomePage extends StatefulWidget {
  //  AQUI É ONDE RECEBE OS PARÂMETROS
  //  O super.key É PADRÃO
  //  O required this.title É PEGA O VALOR DA CONSTANTE final String title;
  const MyHomePage({super.key, required this.title});

  //  final INDICA SER UMA CONSTANTE
  final String title;

  @override
  //  O MÉTODO createState É UMA FUNÇÃO DE FACTORY, ELA É USADA PARA RETORNAR UMA NOVA
  //  INSTÂNCIA DO ESTADO ASSOCIADO AO WIDGET, NO CASO, A CLASSE _MyHomePageState
  State<MyHomePage> createState() => _MyHomePageState();
}

//  CLASSE QUE HERDA O ESTADO DA MyHomePage
//  NO CASO AQUI QUE SERÁ CONSTRUÍDA A VISUALIZAÇÃO DOS WIDGETS NA TELA
class _MyHomePageState extends State<MyHomePage> {
  // UMA VARIÁVEL DE NÚMERO INTEIRO SIMPLES, NO CASO UM ATRIBUTO DA CLASSE
  int _counter = 0;

  //  FUNÇÃO CHAMADA QUANDO SE APERTA O BOTÃO + NA INTERFACE
  void _incrementCounter() {
    //  FUNÇÃO PARA MUDANÇA DE ESTADO
    setState(() {
      _counter++;
    });
  }

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
              'Quantas vezes você apertou o botão:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
