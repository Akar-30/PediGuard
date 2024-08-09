import 'package:flutter/material.dart';

class Addition extends StatefulWidget {
  const Addition({
    super.key,
  });

  @override
  State createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  double _result = 0.0;

  void _calculateResult() {
    double firstNumber = double.tryParse(_firstNumberController.text) ?? 0.0;
    double secondNumber = double.tryParse(_secondNumberController.text) ?? 0.0;
    setState(() {
      _result = firstNumber + secondNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  controller: _firstNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Input 1',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '+',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _secondNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Input 2',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _calculateResult,
                child: const Text('='),
              ),
              const SizedBox(width: 20),
              Text(
                '$_result',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    super.dispose();
  }
}
