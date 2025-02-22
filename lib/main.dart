import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_transition_and_state_management/dto/user.dart';
import 'package:flutter_screen_transition_and_state_management/routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', // ブラウザのタブに表示されるタイトル
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: Routes.home,
        routes: Routes.getRoutes(),
        onGenerateRoute: Routes.getOnGenerateRoute);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.first);
            },
            child: Text("first screenへ"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.second);
            },
            child: Text("second screenへ"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.third,
                  arguments: User(id: "3", password: "qwe", age: 3));
            },
            child: Text("third screenへ"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.riverpodFirst);
            },
            child: Text("riverpod first screenへ"),
          ),
        ],
      )),
    );
  }
}
