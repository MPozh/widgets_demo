import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatelessWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences demo',
      home: MyHomePage(title: 'Shared preferences demo'),
    );
  }
}
 class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key, required this.title}) : super(key: key);

   final String title;

   @override
   _MyHomePageState createState() => _MyHomePageState();
 }

 class _MyHomePageState extends State<MyHomePage> {
   int _counter = 0;

   @override
   void initState(){
     super.initState();
     _loadCounter();
   }

   //вводим значение счетчика на старте
   void _loadCounter() async {
     final prefs = await SharedPreferences.getInstance();
     setState(() {
       _counter = (prefs.getInt('counter') ?? 0);
     });
   }

   //увеличиваем счетчки после клика
   void _incrementCounter() async {
     final prefs = await SharedPreferences.getInstance();
     setState(() {
       _counter = (prefs.getInt('counter') ?? 0) + 1;
       prefs.setInt('counter', _counter);
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
           children: [
             const Text('Вы нажали на кнопку столько раз:',),
             Text(
                 '$_counter',
             style: Theme.of(context).textTheme.headline4,)
           ],
         ),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: _incrementCounter,
         tooltip: 'Увеличить',
         child: const Icon(Icons.add),
       ),
     );
   }
 }