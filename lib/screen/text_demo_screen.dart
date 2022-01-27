import 'package:flutter/material.dart';

class TextDemoScreen extends StatelessWidget {
  const TextDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(color: Colors.blueAccent, width: 5)
            ),
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: const Text('Просто длинный длинный длинный длинный длинный текст',
              softWrap: true,
              style: TextStyle(color: Colors.white, fontSize: 20,),
              overflow: TextOverflow.clip,
               ),
             ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(color: Colors.blueAccent, width: 5)
              ),
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              child: const Text.rich(
                TextSpan(text:'Фрагмент',
                    style: TextStyle(color: Colors.white, fontSize: 20,),
                    children: <TextSpan> [
                    TextSpan(text: " стилизованного", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " текста", style: TextStyle(fontStyle: FontStyle.italic)),
                  ]
                )
              ),
            ),
          ],
        ),
       ),
      ),
    );
  }
}
