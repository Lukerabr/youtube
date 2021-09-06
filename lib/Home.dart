import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca()

    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[

          IconButton(
              onPressed: () async {
                String res = await showSearch(
                    context: context,
                    delegate: CustomSearchDelegate()
                );
                print("Resultado: digitado " + res);
              },
              icon: Icon(Icons.search)
          ),

          /*
          IconButton(
              onPressed: (){
                print("ação: Video Cam!");
              },
              icon: Icon(Icons.videocam)
          ),
          IconButton(
              onPressed: (){
                print("ação: Conta!");
              },
              icon: Icon(Icons.account_circle)
          )
          */

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            icon: Icon(Icons.whatshot),
            label: "Em alta",
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            icon: Icon(Icons.subscriptions),
            label: "Inscrições",
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            icon: Icon(Icons.folder),
            label: "Biblioteca",
          ),
        ],
      ),
    );
  }
}
