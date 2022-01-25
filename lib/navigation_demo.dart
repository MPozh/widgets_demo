import 'package:flutter/material.dart';
import 'package:widgets_demo/text_demo_screen.dart';

class NavigationDemoScreen extends StatefulWidget {
  const NavigationDemoScreen({Key? key}) : super(key: key);

  @override
  _NavigationDemoScreenState createState() => _NavigationDemoScreenState();
}

class _NavigationDemoScreenState extends State<NavigationDemoScreen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const MailScreen() - home здесь нельзя указывать, не работает с initialRoute
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/contacts': (context) => const SecondScreen(),
        '/radio': (context) => const RadioScreen(),
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
              const Text("Кейс 2.3 Навигация")
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
        Navigator.pushNamed(context, '/contacts');
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

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная')),
      drawer: navDrawer(context),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Главная страница'),
            const SizedBox(height: 100,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contacts');
                  },
               child: const Text('Контакты'),
            ),
           ]
        ),
      ),
    );
  }
}

class SecondScreen1 extends StatelessWidget {
  const SecondScreen1({Key? key}) : super(key: key);

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
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttoned =
    TextButton.styleFrom(primary: Theme
        .of(context)
        .colorScheme
        .onPrimary);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Контакты"),
          actions: <Widget>[
            IconButton(
                tooltip: "Досье",
                onPressed: () {}, icon: const Icon(Icons.wallet_travel)),
            IconButton(onPressed: () {},
                icon: const Icon(Icons.production_quantity_limits)),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/radio');
              },
              child: const Text("Выбрать"),
              style: buttoned,)
          ],
        ),
        drawer: navDrawer(context),
        body: Center(child: Text("Контент")),
      ),
    );
  }
}



class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  _RadioScreenState createState() => _RadioScreenState();
}

enum Person {first, second, third}

class _RadioScreenState extends State<RadioScreen> {
  bool _checked = false;
  //bool _confirmAgreement = true;
  Person? _person = Person.first;

  void _onPersChange(Person? value) {
    setState(() {
      _person = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(value: _checked, onChanged: (val) {
                      setState(() {
                        _checked = !_checked;
                      });
                    }),
                    Text('Необходимо выбрать'),
                  ],
                ),
                const Text('Участники: '),
                RadioListTile<Person>(
                  title: const Text('Вася'),
                  value: Person.first,
                  groupValue: _person,
                  onChanged: _onPersChange,
                ),
                RadioListTile<Person>(
                  title: const Text('Петя'),
                  value: Person.second,
                  groupValue: _person,
                  onChanged: _onPersChange,
                ),
                RadioListTile<Person>(
                  title: const Text('Серёжа'),
                  value: Person.third,
                  groupValue: _person,
                  onChanged: _onPersChange,
                ),
                const SizedBox(height: 100,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('На главную'),
                ),
              ]
          ),
        ),
      ),
    );
  }
}

