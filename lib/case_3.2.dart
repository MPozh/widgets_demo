import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_demo/utils/global_theme.dart';

Future<Post> fetchPost() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode ==200) {
    //если сервер вернет ответ 200 ok, то загружаем данные
    return Post.fromJson(jsonDecode(response.body));
  } else {
    //если сервер не вернет ответ 200 ok, то выбрасываем исключение
    throw Exception('Не удалось загрузить пост');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class NetWorkScreen1 extends StatefulWidget {
  const NetWorkScreen1({Key? key}) : super(key: key);

  @override
  _NetWorkScreen1State createState() => _NetWorkScreen1State();
}

class _NetWorkScreen1State extends State<NetWorkScreen1> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Пример загрузки данных'),
          ),
          body: Center(
           child: Column(mainAxisSize: MainAxisSize.min,
             children:[
             Text("Заголовок", style: Theme.of(context).textTheme.headline5,),
             SizedBox(height: 10,),
             FutureBuilder<Post>(
                  future: futurePost,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2,);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    //по умолчанию показать крутилку
                    return const CircularProgressIndicator();
                  },
                ),
               SizedBox(height: 10,),
               Text('Тело', style: Theme.of(context).textTheme.headline5,),
               SizedBox(height: 10,),
               FutureBuilder<Post>(
                 future: futurePost,
                 builder: (context, snapshot) {
                 if (snapshot.hasData) {
                return Text(snapshot.data!.body, textAlign: TextAlign.center,);
                 }    else if (snapshot.hasError) {
                return Text('${snapshot.error}');
                 }
                   //по умолчанию показать крутилку
                return const CircularProgressIndicator();
                },
               ),
            ],
           ),
        ),
      ),
    );
  }
}




