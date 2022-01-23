import 'package:flutter/material.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

enum Skilllevel {junior, middle, senior}

class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  bool _checked = false;
  bool _confirmAgreement = true;
  Skilllevel? _skilllevel = Skilllevel.junior;

  void _onSkillChange(Skilllevel? value) {
    setState(() {
      _skilllevel = value;
    });
  }

  void  _onCheckedChange(bool? val) {
     setState(() {
        _checked = !_checked;
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
                   Checkbox(value: _checked, onChanged: _onCheckedChange),
                   Text('Выбор'),
                 ],
               ),
               CheckboxListTile(
                      title: Text('Принять условия соглашения'),
                      value: _confirmAgreement, onChanged: (val) {
                        setState(() {
                          _confirmAgreement = !_confirmAgreement;
                        });
                  }),
               Row(
                 children: [
                   Switch(value: _checked, onChanged: _onCheckedChange),
                   const Text('Включить')
                 ],
               ),
               SwitchListTile(
                 title: const Text('Включить'),
                 value: _checked,
                 onChanged: _onCheckedChange,
               ),
             const Text('Уровень навыков: '),
             RadioListTile<Skilllevel>(
                 title: const Text('junior'),
                 value: Skilllevel.junior,
                 groupValue: _skilllevel,
                 onChanged: _onSkillChange,
             ),
               RadioListTile<Skilllevel>(
                 title: const Text('middle'),
                 value: Skilllevel.middle,
                 groupValue: _skilllevel,
                 onChanged: _onSkillChange,
               ),
               RadioListTile<Skilllevel>(
                 title: const Text('senior'),
                 value: Skilllevel.senior,
                 groupValue: _skilllevel,
                 onChanged: _onSkillChange,
               ),
             ]
          ),
        ),
      ),
    );
  }
}
