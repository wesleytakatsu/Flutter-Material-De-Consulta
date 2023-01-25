import 'package:flutter/material.dart';

class NotificacaoPage extends StatelessWidget {
  const NotificacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 0, 97),
      appBar: AppBar(
        title: const Text('Novidades'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.message_outlined,
              size: 48,
            ),
            Text(
              'Você abriu a tela da notificação ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
