import 'package:flutter/material.dart';
import 'package:flutter_screen_transition_and_state_management/dto/user.dart';
import 'package:flutter_screen_transition_and_state_management/routes.dart';

class FourthScreen extends StatefulWidget {
  final User user;
  const FourthScreen({super.key, required this.user});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
        title: Text("Fourth Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("id: ${user.id}"),
          Text("password: ${user.password}"),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName(Routes.home));
            },
            child: Text("戻る"),
          ),
        ],
      )),
    );
  }
}
