import 'package:flutter/material.dart';
import 'package:flutter_screen_transition_and_state_management/dto/user.dart';
import 'package:flutter_screen_transition_and_state_management/routes.dart';

class ThirdScreen extends StatefulWidget {
  final User user;
  const ThirdScreen({super.key, required this.user});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("id: ${user.id}"),
          Text("password: ${user.password}"),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.fourth,
                  arguments: User(id: "4", password: "asdf", age: 4));
            },
            child: Text("fourth screenへ"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("戻る"),
          ),
        ],
      )),
    );
  }
}
