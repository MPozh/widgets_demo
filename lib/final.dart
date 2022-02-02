import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgets_demo/screen/network_list_screen.dart';
import 'package:widgets_demo/utils/global_theme.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      //home: const MailScreen() - home здесь нельзя указывать, не работает с initialRoute
      initialRoute: '/',
      routes: {
        '/': (context) => const Main(),
        '/list': (context) => const ListScreen(),
 //       '/radio': (context) => const RadioScreen(),
      },
    );
  }
}

Widget navDrawer(context) => Drawer(
  child: ListView(padding: EdgeInsets.zero, children: [
    DrawerHeader(
        decoration: const BoxDecoration(color: Colors.blue),
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
                child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/320px-Google-flutter-logo.svg.png",),
              ),
              const Text("Попытка")
            ],
          ),
        )
    ),

    ListTile(
      leading: const Icon(Icons.one_k),
      title: const Text("Главная"),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/');
      },
    ),
    ListTile(
      leading: const Icon(Icons.two_k),
      title: const Text("Контакты"),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/list');
      },
    ),
    const Divider(),
    const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text("Профиль"),
    ),
    ListTile(
      leading: const Icon(Icons.three_k),
      title: const Text("Выбор"),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/radio');
      },
    ),
  ],
  ),
);


class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2));

    const linkTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0079D0),
    );

    return MaterialApp(
     home: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/1.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 60,),
                  const SizedBox(width: 110, height: 84, child: Image(image: AssetImage('assets/logo.png')),),
                  SizedBox(height: 20,),
                  Text('Введите логин в виде 10 цифр номера телефона',
                    style: TextStyle(fontSize: 15, color: Color.fromRGBO(0, 0, 0, 0.6)),),
                  SizedBox(height: 20,),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFECEFF1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Телефон',
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFECEFF1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Пароль',
                    ),
                  ),
                  SizedBox(height: 28,),
                  SizedBox(width:154, height: 42, child:
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/list');
                  },
                    child: Text('Войти'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                    ),
                  ),
                  ),
                  SizedBox(height: 42,),
                  InkWell(child: const Text('Регистрация', style: linkTextStyle,),
                      onTap: () {}),
                  SizedBox(height: 20,),
                  InkWell(child: const Text('Забыли пароль?', style: linkTextStyle,),
                      onTap: () {}),

                ],),
              ),
            )
        ),
    );
  }
}



