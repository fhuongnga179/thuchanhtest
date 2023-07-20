import 'package:flutter/material.dart';

void main() {
  runApp(PrimeCheckerApp());
}

class PrimeCheckerApp extends StatefulWidget {
  @override
  _PrimeCheckerAppState createState() => _PrimeCheckerAppState();
}

class _PrimeCheckerAppState extends State<PrimeCheckerApp> {
  TextEditingController _numberController = TextEditingController();
  String _resultMessage = '';

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }

    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }

    return true;
  }

  void _checkPrime() {
    setState(() {
      int number = int.tryParse(_numberController.text) ?? 0;
      if (isPrime(number)) {
        _resultMessage = '$number là số nguyên tố.';
      } else {
        _resultMessage = '$number không phải là số nguyên tố.';
      }
    });
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kiểm tra số nguyên tố'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
                width: 300,
                child: TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nhập một số nguyên',
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _checkPrime,
                child: Text('Kiểm tra'),
              ),
              SizedBox(height: 16.0),
              Text(_resultMessage),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}
