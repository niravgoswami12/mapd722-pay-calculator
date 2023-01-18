
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Pay Calculator';

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal
      ),
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {

  final _formKey = GlobalKey<FormState>();
  double numberOfHours = 0;
  double hoursRate = 0;
  double regularPay = 0;
  double overtimePay = 0;
  double totalPay = 0;
  double tax = 0;

  calculateRegularPay() {
    if (numberOfHours <= 40) {
      regularPay = numberOfHours * hoursRate;
      overtimePay = 0;
    } else {
      overtimePay = (numberOfHours - 40) * hoursRate * 1.5;
      regularPay = 40 * hoursRate;
    }
    // Total pay pre tax
    totalPay = regularPay + overtimePay;

    // Tax based on total pay
    tax = totalPay * 0.18;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a number of hour',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter number of hours';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        numberOfHours = double.parse(value!);
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a hourly rate',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter number of hours';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        hoursRate = double.parse(value!);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        calculateRegularPay();
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                ),
              ],
            ),
          ),
        
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20)
              ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height:5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Report',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          const Text(
                            'Regular Pay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '$regularPay',
                            style: const TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            'Overtime Pay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '$overtimePay',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            'Total pay',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '$totalPay',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            'Tax',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '$tax',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        AboutWidget()
        
      ],
    );
  }
}


class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SizedBox(height:5),
                  Text(
                    'Nirav Goswami',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    'ID: 301252385',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(height:5),
                ],
              ))
        ;
  }
}