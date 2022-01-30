import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:widgets_demo/utils/global_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FilesDemoScreen1 extends StatelessWidget {
  const FilesDemoScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: FlutterDemo(storage: CounterStorage()),
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;
  int _counter1 = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }







  void initState1(){
    super.initState();
    _loadCounter();
  }

  //вводим значение счетчика на старте
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter') ?? 0);
    });
  }

  //увеличиваем счетчки после клика
  void _incrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter1);
    });
  }








  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кейс 3.1 Работа с данными'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Считаем нажатия на кнопки:', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5,),
              const SizedBox(height: 100,),
              Text('Кнопка №1 записывает нажатия в файл. Она нажата $_counter раз(а).', textAlign: TextAlign.center,),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Нажми на кнопку №1'),),
              const SizedBox(height: 100,),
              Text('Кнопка №2 записывает нажатия в "ключ-значение". Она нажата $_counter1 раз(а).', textAlign: TextAlign.center, ),
              ElevatedButton(
                onPressed: _incrementCounter1,
                child: const Text('Нажми на кнопку №2'),),
            ]
         ),
        ),
      );
  }
}