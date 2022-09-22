import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: TextEditingController(text: "find a task"),
                key: const Key("textField"),
                decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 231, 231, 231),
                    filled: true,
                    hintText: "Enter a text"),
              ),
            ),
            ElevatedButton(
                key: const Key("pressButton"),
                onPressed: () {},
                child: const Text("Press here"))
          ],
        ),
      ),
    );
  }
}
