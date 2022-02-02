import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_demo/utils/global_theme.dart';

import '../final.dart';


Future<List<User>> fetchUsers(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode ==200) {
    //если сервер вернет ответ 200 ok, то загружаем данные
    //return Users.fromJson(jsonDecode(response.body));
    return compute(parseUsers, response.body);

  } else {
    //если сервер не вернет ответ 200 ok, то выбрасываем исключение
    throw Exception('Не удалось загрузить альбом');
  }
}

List<User> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

class User {
  final int id;
  final String name;
  //final String username;
  final String email;
  //final String address;
  //final String phone;
  //final String website;
  //final String company;

  const User({
    required this.id,
    required this.name,
  //required this.username,
    required this.email,
  //required this.address,
  //required this.phone,
  //required this.website,
    //required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      //username: json['username'] as String,
      email: json['email'] as String,
      //address: json['address'] as String,
      //phone: json['phone'] as String,
      //website: json['website'] as String,
      //company: json['company'] as String,
    );
  }
}

//class NetWorkScreen2 extends StatelessWidget {
//  const NetWorkScreen2 ({Key? key}) : super(key: key);
class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const appTitle = 'Демочка';
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Название'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text("Выбрать"),
            style: TextButton.styleFrom(primary: Theme
                .of(context)
                .colorScheme
                .onPrimary)),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Ошиб'),
            );
          } else if (snapshot.hasData) {
            return UsersList(users: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({Key? key, required this.users}) : super(key: key);

  final List<User> users;

   @override
  Widget build(BuildContext context) {
//    return GridView.builder(
//      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//      ),
//      itemCount: photos.length,
//      itemBuilder: (context, index) {
//        return Image.network(photos[index].thumbnailUrl);
//      },
//    );
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('User $users'),
              onTap: () {}
              );
         // return Image.network(photos[index].thumbnailUrl);
        },
    );
  }
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Контакты')),
      drawer: navDrawer(context),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Страница контактов'),
              const SizedBox(height: 100,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Назад'),),
            ]
        ),
      ),
    );
  }
