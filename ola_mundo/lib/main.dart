import 'package:flutter/material.dart';
 
void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
@override
  Widget build(BuildContext context){
    return Center ( child:
      Text('Olá mundo! Aqui é o Prof Wesley.', textDirection: TextDirection.ltr,)
    );
  }
}
