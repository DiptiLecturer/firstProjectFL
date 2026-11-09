import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  String result = "0";

  void calculate(String operation) {
    double num1 = double.parse(firstController.text);
    double num2 = double.parse(secondController.text);

    double answer = 0;

    if (operation == "sum") {
      answer = num1 + num2;
    } else if (operation == "sub") {
      answer = num1 - num2;
    } else if (operation == "mul") {
      answer = num1 * num2;
    } else if(operation == "div"){
      if(num2 == 0){
        setState(() {
          result = "Can not divided by zero";
        });
        return;
      }
      answer = num1 / num2;
    }
    setState(() {
      result = answer.toString();
    });
    firstController.clear();
    secondController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "First Number",
                prefixIcon: Icon(Icons.looks_one),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Second Number",
                prefixIcon: Icon(Icons.looks_two),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      calculate("sum");
                      // Highlights the operation to the user via a Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('addition performed'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text("Sum(+)"),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: ()=> {calculate("sub")},
                    child: const Text("Sub(-)"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => {calculate("mul")},
                    child: const Text("Multiply(*)"),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => {calculate("div")},
                    child: const Text("Div(/)"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Text(
              result,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
