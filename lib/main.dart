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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "First Number",
                prefixIcon: Icon(Icons.looks_one),
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Second Number",
                prefixIcon: Icon(Icons.looks_two),
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(child:ElevatedButton(
                    onPressed: () {}, child: const Text("Sum(+)")
                )
                ),
                const SizedBox(width: 15),
                Expanded(child:ElevatedButton(
                    onPressed: () {}, child: const Text("Sub(-)")
                )
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(child:ElevatedButton(
                    onPressed: () {}, child: const Text("Multiply(*)")
                )
                ),
                const SizedBox(width: 15),
                Expanded(child:ElevatedButton(
                    onPressed: () {}, child: const Text("Div(/)")
                )
                ),
              ],
            ),
            const SizedBox(height: 30),
          
            Text(
                "0",
              style: TextStyle(
                fontSize: 32,fontWeight: FontWeight.bold,
                color: Colors.blue
              ),
            )
          ],
        ),
      ),
    );
  }
}
