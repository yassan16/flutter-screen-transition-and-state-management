import 'package:flutter/material.dart';
import 'package:flutter_screen_transition_and_state_management/dto/user.dart';
import 'package:flutter_screen_transition_and_state_management/view/has_argument/fourth_screen.dart';
import 'package:flutter_screen_transition_and_state_management/view/has_argument/third_screen.dart';
import 'package:flutter_screen_transition_and_state_management/view/no_argument/first_screen.dart';
import 'package:flutter_screen_transition_and_state_management/view/no_argument/second_screen.dart';

class Routes {
  // 引数なし
  static const String home = "/";
  static const String first = "/first_screen";
  static const String second = "/second_screen";

  // 引数あり
  static const String third = "/third_screen";
  static const String fourth = "/fourth_screen";

  /// 引数なしルーティングの設定
  static getRoutes() {
    return {
      Routes.first: (context) => FirstScreen(),
      Routes.second: (context) => SecondScreen(),
    };
  }

  /// 引数ありルーティングの設定
  static Route<dynamic>? getOnGenerateRoute(settings) {
    print("path: ${settings.name}");
    print("引数: ${settings.arguments}");

    if (settings.name == Routes.third) {
      // 引数を取得
      final args = settings.arguments as User;
      return MaterialPageRoute(
          builder: (context) => ThirdScreen(
                user: args,
              ));
    } else if (settings.name == Routes.fourth) {
      final args = settings.arguments as User;
      return MaterialPageRoute(
          builder: (context) => FourthScreen(
                user: args,
              ));
    }
    return null;
  }
}
