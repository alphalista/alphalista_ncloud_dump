import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // Controllers for each input field
  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();
  final TextEditingController _input3Controller = TextEditingController();
  final TextEditingController _input4Controller = TextEditingController();
  final TextEditingController _input5Controller = TextEditingController();
  final TextEditingController _input6Controller = TextEditingController();
  final TextEditingController _input7Controller = TextEditingController();

  String _output = '';

  void _calculateOutput() {
    // Example: Summing up the values entered in the text fields
    setState(() {
      _output = 'Sum: ' +
          (_parseToDouble(_input1Controller.text) +
              _parseToDouble(_input2Controller.text) +
              _parseToDouble(_input3Controller.text) +
              _parseToDouble(_input4Controller.text) +
              _parseToDouble(_input5Controller.text) +
              _parseToDouble(_input6Controller.text) +
              _parseToDouble(_input7Controller.text))
              .toStringAsFixed(2);
    });
  }

  double _parseToDouble(String value) {
    return double.tryParse(value) ?? 0.0; // Default to 0 if parsing fails
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _input1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input 1'),
            ),
            TextField(
              controller: _input2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input 2'),
            ),
            TextField(
              controller: _input3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input 3'),
            ),
            TextField(
              controller: _input4Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input 4'),
            ),
            TextField(
              controller: _input5Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input 5'),
            ),
            TextField(
              controller: _input6Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input 6'),
            ),
            TextField(
              controller: _input7Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input 7'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateOutput,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              _output,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

