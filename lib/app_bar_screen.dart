//import 'dart:html';

import 'package:flutter/material.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonstyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Демо AppBar"),
          actions: <Widget>[
            IconButton(
                tooltip: "Содержимое",
                onPressed: (){}, icon: const Icon(Icons.wallet_travel)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.access_alarm)),
            TextButton(
                onPressed: () {},
                child: const Text("Профиль"),
                style: buttonstyle,)
          ],
        ),
        body: Center(child: Text("Контент")),
      ),
    );
  }
}
