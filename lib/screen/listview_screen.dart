import 'package:flutter/material.dart';
import 'package:widgets_demo/utils/global_theme.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
        //body: ListBuilder()
        //body: SimpleListSeparated()
        body: MyStatefulVidget2()
        ),
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem ({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all()
      ),
        child: Text('Элемент # $number', style: Theme.of(context).textTheme.headline6),
     );
  }
}

class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const <Widget> [
        ListTile(
         leading: Icon(Icons.map),
         title: Text('Map'),
        ),
        ListTile(
         leading: Icon(Icons.photo_album),
         title: Text('Album'),
        ),
        ListTile(
         leading: Icon(Icons.phone),
         title: Text('Phone'),
        ),
       // children: [const
        MyListItem(number: 1),
        MyListItem(number: 2),
        MyListItem(number: 3),
        MyListItem(number: 4),
        MyListItem(number: 5),
        MyListItem(number: 6),
        MyListItem(number: 7),
        MyListItem(number: 8),
        MyListItem(number: 9),
        MyListItem(number: 10),
        MyListItem(number: 11),
        MyListItem(number: 12),
        Text('Первый'),
        Text('Первый'),
        Text('Первый'),


      ],
    );
  }
}

class SimpleListBuilder extends StatelessWidget {
  const SimpleListBuilder({Key? key}) : super(key: key);

 // var list = List<int>.generate(50, (i) => i+1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return MyListItem(number: index);
        }
    );
  }
}

class SimpleListSeparated extends StatelessWidget {
  SimpleListSeparated({Key? key}) : super(key: key);

  var list = List<int>.generate(50, (i) => i+1);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return MyListItem(number: index);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 3,),
    );
  }
}

class MyStatefulVidget extends StatefulWidget {
  const MyStatefulVidget({Key? key}) : super(key: key);

  @override
  _MyStatefulVidgetState createState() => _MyStatefulVidgetState();
}

class _MyStatefulVidgetState extends State<MyStatefulVidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text('Item $index'),
              selected: index == _selectedIndex,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              });
           }
    );
  }
}

class MyStatefulVidget2 extends StatefulWidget {
  const MyStatefulVidget2({Key? key}) : super(key: key);

  @override
  _MyStatefulVidget2State createState() => _MyStatefulVidget2State();
}

class _MyStatefulVidget2State extends State<MyStatefulVidget2> {
  int _selectedIndex = 0;
  var list = List<int>.generate(20, (i) => i+1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text('Item $index'),
              selected: index == _selectedIndex,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              });
        }
    );
  }
}