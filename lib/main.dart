import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num = 1;

  void increase(int n) {
    setState(() {
      num = num + n;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double screenSize = size * 0.8;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: AComponent(num: num)),
            Expanded(child: BComponent(increase: increase)),
          ],
        ),
      ),
    );
  }
}

//컨슈머라고 불림(소비자)
class AComponent extends StatelessWidget {
  final int num;
  const AComponent({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Text("AComponent"),
          Text("${num}",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class BComponent extends StatelessWidget {
  final increase;
  const BComponent({Key? key, required this.increase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          Text("BComponent"),
          Container(
              child: ElevatedButton(
                  onPressed: () {
                    increase(3);
                  },
                  child: Text("숫자증가",
                      style: TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold))))
        ],
      ),
    );
  }
}
