import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode ==200) {
    //если сервер вернет ответ 200 ok, то загружаем данные
    return Album.fromJson(jsonDecode(response.body));
  } else {
    //если сервер не вернет ответ 200 ok, то выбрасываем исключение
    throw Exception('Не удалось загрузить альбом');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
});
    factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class NetWorkScreen extends StatefulWidget {
  const NetWorkScreen({Key? key}) : super(key: key);

  @override
  _NetWorkScreenState createState() => _NetWorkScreenState();
}

class _NetWorkScreenState extends State<NetWorkScreen> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Пример загрузки данных',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Пример загрузки данных'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
              builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //по умолчанию показать крутилку
              return const CircularProgressIndicator();
              },
          ),
        ),
      ),
    );
  }
}










