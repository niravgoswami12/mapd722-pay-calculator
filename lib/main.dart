import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
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
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a number of hour',
                ),
                // The validator receives the text that the user has entered.
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
                // The validator receives the text that the user has entered.
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
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  _formKey.currentState?.save();
                  calculateRegularPay();
                  
                }
              },
              child: const Text('Calculate'),
            ),
          ),
          Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              color: Colors.teal,
              alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Reports',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 36,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Regular Pay',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                          '$regularPay',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Overtime Pay',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            '$overtimePay',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total pay',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            '$totalPay',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Tax',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            '$tax',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              color: Colors.teal,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Nirav Goswami',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    '301252385',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
