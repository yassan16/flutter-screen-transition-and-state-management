import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/future_sample_notifier.g.dart';
// 自動生成コマンド
// flutter pub run build_runner build --delete-conflicting-outputs

@riverpod
class FutureSampleNotifier extends _$FutureSampleNotifier {
  // 戻り値のUserを見てStateを判断している
  @override
  Future<String> build() {
    // Futureを返すことで非同期処理を模擬
    return Future.delayed(
        const Duration(seconds: 2), () => "AsyncNotifierを呼び出した!!");
  }

  // 非同期処理を模擬する
  // 戻り値は、試しで適当な値を返している
  Future<int> updateState() async {
    // データを上書き
    state = const AsyncValue.loading();
    // 3秒まつ
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    // データを上書き
    state = const AsyncValue.data('新しいデータを取得した!!');

    // ステータスコードのつもり
    return 201;
  }
}
