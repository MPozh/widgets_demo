import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_demo/utils/global_theme.dart';

import '../final.dart';


Future<List<User>> fetchUsersList() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode ==200) {
    List jsonResponse = json.decode(response.body);
    //если сервер вернет ответ 200 ok, то загружаем данные
    //return Users.fromJson(jsonDecode(response.body));
    return jsonResponse.map((user) => User.fromJson(user)).toList();

  } else {
    //если сервер не вернет ответ 200 ok, то выбрасываем исключение
    throw Exception('Не удалось загрузить список пользователей');
  }
}

ListView usersListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return userListTile(data[index].name, data[index].email, Icons.work);
      });
}

ListTile userListTile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.purple,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.purpleAccent[100],
    ),
  );

class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}


class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  late Future<List<User>> futureUsersList;
  late List<User> usersListData;

  @override
  void initState() {
    super.initState();
    futureUsersList = fetchUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
        home: Scaffold(
         appBar: AppBar(title: const Text('Контакты'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text("Выйти"),
                style: TextButton.styleFrom(primary: Theme
                    .of(context)
                    .colorScheme
                    .onPrimary),)
            ],),
         drawer: navDrawer(context),
         body:   Center(
           child: FutureBuilder<List<User>>(
            future: futureUsersList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                usersListData = snapshot.data!;
                return usersListView(usersListData);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            })
    ),
    ),
    );
  }
}

Widget navDrawer(context) => Drawer(
  child: ListView(padding: EdgeInsets.zero, children: [
    DrawerHeader(
        decoration: const BoxDecoration(color: Colors.purple),
        child: Container(height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                ),
                child: Image.network("https://static10.tgstat.ru/channels/_0/b1/b1cf4bacedfe34fd4386f7ef923b1310.jpg",),
              ),
              const Text("Досье",style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
            ],
          ),
        )
    ),

    ListTile(
      leading: const Icon(Icons.one_k, color: Colors.deepPurple,),
      title: const Text("Главная", style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/');
      },
    ),
    ListTile(
      leading: const Icon(Icons.two_k, color: Colors.deepPurple,),
      title: const Text("Контакты", style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/list');
      },
    ),
    const Divider(),
    const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text("Профиль", style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
    ),
    ListTile(
      leading: const Icon(Icons.three_k, color: Colors.deepPurple,),
      title: const Text("Подробнее", style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/second');
      },
    ),
  ],
  ),
);


class SecondScreen1 extends StatefulWidget {
  const SecondScreen1({Key? key}) : super(key: key);

  @override
  _SecondScreen1State createState() => _SecondScreen1State();
}

class _SecondScreen1State extends State<SecondScreen1> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Контакты'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text("Выйти"),
            style: TextButton.styleFrom(primary: Theme
                .of(context)
                .colorScheme
                .onPrimary),)
        ],),
        drawer: navDrawer(context),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Адрес, место работы'),
                const SizedBox(height: 100,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Назад'),),
              ]
          ),
        ),
      ),
    );
  }
}