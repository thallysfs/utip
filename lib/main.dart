import 'package:flutter/material.dart';
import 'package:utip/widgets/amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_row.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Utip(),
    );
  }
}

class Utip extends StatefulWidget {
  const Utip({super.key});

  @override
  State<Utip> createState() => _UtipState();
}

class _UtipState extends State<Utip> {
  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    return ((_billTotal * _tipPercentage) + (_billTotal) / _personCount);
  }

  double totalTip() {
    return ((_billTotal * _tipPercentage));
  }

  //methods
  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    if (_personCount > 1) {
      setState(() {
        _personCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();

    // add style
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPersonal(style: style, total: total, theme: theme),
          //Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 100,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2,
                  )),
              child: Column(
                children: [
                  AmountField(
                    billAmount: _billTotal.toString(),
                    onChanged: (value) {
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                      //print("Amount: $value");
                    },
                  ),
                  // Split Bill area
                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    onDrecrement: decrement,
                    onIncrement: increment,
                  ),
                  // === Tip Section ==
                  TipRow(theme: theme, totalT: totalT),
                  // == slider text ==
                  Text('${(_tipPercentage * 100).round()}%'),
                  // == Tip slider ==
                  TipSlider(
                    tipPercentage: _tipPercentage,
                    onChanged: (double value) {
                      setState(() {
                        _tipPercentage = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
