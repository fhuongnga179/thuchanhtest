import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatefulWidget {
  @override
  _MyCalculatorAppState createState() => _MyCalculatorAppState();
}

class _MyCalculatorAppState extends State<MyCalculatorApp> {
  double a = 0.0;
  double b = 0.0;
  double result = 0.0;

  void _calculateSum() {
    setState(() {
      result = a + b;
    });
  }

  void _calculateDifference() {
    setState(() {
      result = a - b;
    });
  }

  void _calculateProduct() {
    setState(() {
      result = a * b;
    });
  }

  void _calculateQuotient() {
    if (b != 0) {
      setState(() {
        result = a / b;
      });
    } else {
      // Xử lý khi số b là 0 để tránh chia cho 0.
      // Bạn có thể đưa ra cảnh báo hoặc sử dụng kết quả NaN.
      setState(() {
        result = double.nan;
      });
    }
  }

  void _reset() {
    setState(() {
      a = 0.0;
      b = 0.0;
      result = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Kết quả: $result'),
              SizedBox(height: 16.0),
              Container(
                width: 250,
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => a = double.tryParse(value) ?? 0.0,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Nhập số a'),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      onChanged: (value) => b = double.tryParse(value) ?? 0.0,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Nhập số b'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _calculateSum,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Màu nền khi nút được nhấn
                      onPrimary: Colors.white, // Màu chữ khi nút được nhấn
                    ),
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: _calculateDifference,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Màu nền khi nút được nhấn
                      onPrimary: Colors.white, // Màu chữ khi nút được nhấn
                    ),
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: _calculateProduct,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Màu nền khi nút được nhấn
                      onPrimary: Colors.white, // Màu chữ khi nút được nhấn
                    ),
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: _calculateQuotient,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Màu nền khi nút được nhấn
                      onPrimary: Colors.white, // Màu chữ khi nút được nhấn
                    ),
                    child: Text('/'),
                  ),
                  ElevatedButton(
                    onPressed: _reset,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Màu nền khi nút được nhấn
                      onPrimary: Colors.white, // Màu chữ khi nút được nhấn
                    ),
                    child: Text('Đặt lại'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
