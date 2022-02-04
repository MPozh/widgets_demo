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
        '/list': (context) => const UsersListScreen(),
        '/second': (context) => const SecondScreen1(),
      },
    );
  }
}


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
      color: Color(0xFF800080),
    );

    return MaterialApp(
      theme: globalTheme(),
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
                    style: TextStyle(fontSize: 15, color: Color.fromRGBO(128, 0, 128, 0.6)),),
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
                    child: Text('Войти', style: Theme.of(context).textTheme.headline5,),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary,
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



