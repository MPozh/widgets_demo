import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';


  class PizzaCalcScreen extends StatefulWidget {
     const PizzaCalcScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalcScreenState createState() => _PizzaCalcScreenState();
  }

  enum Sauce {hot, sweet, cheese}

  class _PizzaCalcScreenState extends State<PizzaCalcScreen> {
  bool _isslimDough = false;
  double _pizzaSize = 40;
  int _cost = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;

  int _calcCost() {
  _cost = _pizzaSize.round() + 100;

  if (_isslimDough == true) _cost += 30;
  if (_addCheese == true) _cost += 50;

  switch (_sauce) {
  case Sauce.hot:
  _cost += 10;
  break;
  case Sauce.sweet:
  _cost +=20;
  break;
  case Sauce.cheese:
  _cost += 40;
  break;
    case null:
      _sauce = Sauce.hot;
  break;
  }
  return _cost;
  }

  void _onSauceChanged(Sauce? value) {
  setState(() {
  _sauce = value;
  });
 }

  @override
  Widget build(BuildContext context) {


  return MaterialApp(
    home: Scaffold(
      body: Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 62,
              ),
              SizedBox(
                height: 100,
                child: Image.asset('assets/pizza.jpg'),
              ),

              const Text('Калькулятор пиццы',
                style: TextStyle(fontSize: 36, color: Colors.black),),
              const Text('Выберите параметры',
                style: TextStyle(fontSize: 16, color: Colors.black),),
              const SizedBox(height: 12,),
              SizedBox(width: 300,
                child: SlidingSwitch(
                  value: false,
                  width: 300,
                  onChanged: (bool value) {
                   _isslimDough = value;
                    setState(() {
                      _calcCost();
                    });
                  },
                  height: 30,
                  animationDuration: const Duration(milliseconds: 100),
                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                  textOff: "Обычное тесто",
                  textOn: "Тонкое тесто",
                  colorOn: Colors.black,
                  colorOff: Colors.black38,
                  background: Colors.blueGrey,
                  buttonColor: Colors.blueAccent,
                  inactiveColor: Colors.teal,
                  ),
              ),

              const SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: const Text('Размер',
                style: TextStyle(fontSize: 18, color: Colors.black),),
              ),
              SizedBox(width: 300,
                  child: SfSlider(
                    min: 20,
                    max: 60,
                    value: _pizzaSize,
                    interval: 20,
                    showTicks: true,
                    showLabels: true,
                    numberFormat: NumberFormat("## см"),
                    enableTooltip: false,
                    minorTicksPerInterval: 0,
                    stepSize: 20,
                    onChanged: (dynamic value) {
                      setState(() {
                        _pizzaSize = value;
                        _calcCost();
                      });
                    }
                  ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: const Text("Соус",
                style: TextStyle(fontSize: 18, color: Colors.black),),
              ),

              RadioListTile<Sauce>(
                  title: const Text('Острый'),
                  value: Sauce.hot,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                   ),
              RadioListTile<Sauce>(
                title: const Text('Кисло-сладкий'),
                value: Sauce.sweet,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
              ),
              RadioListTile<Sauce>(
                title: const Text('Сырный'),
                value: Sauce.cheese,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
              ),

              SizedBox(
                width: 300,
                child: Card(
                  elevation: 0,
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            right: 20,),
                      child: SizedBox(
                        width: 30,
                        height: 56,
                        child: Image.asset('assets/cheese_icon.png'),
                      )),
                      const Text('Дополнительный сыр',
                           style: TextStyle(fontSize: 16, color: Colors.blue)),
                      Switch(
                          value: _addCheese,
                          onChanged: (bool value) {
                            setState(() {
                              _addCheese = value;
                              _calcCost();
                            });
                          })
                    ],
                  ),
                ),
              ),

        //выводим итоговую стоимость
           Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: const Text("Стоимость: ",
                  style: TextStyle(fontSize: 16, color: Colors.blue)),
           ),

        //цена в отдельной строке
           SizedBox(width: 300, height: 50,
             child: Card(
               elevation: 0,
               color: Colors.deepPurple,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)),
               child: Text("${_calcCost()} руб.  ",
               style: const TextStyle(fontSize: 32, color: Colors.black),
               textAlign: TextAlign.center,)
             ),
          ),
           const SizedBox(height: 40,),
           const SizedBox(width: 156,),


          ]),
        )),
  );
  }
  }


















