import 'package:flutter_screen_transition_and_state_management/dto/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// libから見た相対パスで指定
part 'generated/user_manager_notifier.g.dart';

// 自動生成コマンド
// flutter pub run build_runner build --delete-conflicting-outputs

@Riverpod(keepAlive: true)
class UserManager extends _$UserManager {
  // 戻り値のUserを見てStateを判断している
  @override
  User build() {
    return User(id: "0", password: "riverpod", age: 0);
  }

  void changeUser() {
    String id = "${state.id}0";
    String password = "${state.password}!";
    int age = state.age + 1;
    state = User(id: id, password: password, age: age);
    print(
        "今のUser\nid: ${state.id}\npassword: ${state.password}\nage: ${state.age}");
  }
}
