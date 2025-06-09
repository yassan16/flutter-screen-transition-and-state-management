# 概要
「画面遷移」と「状態管理(ステート)」について、サンプルコードを用いて、実装方法を学ぶ。

## 状態管理 (Riverpod 2.0)
### 登場人物
* State ... 状態
* Provider ... 「state」を守る壁、「state」の変更はできない
* ConsumerWidget ... 「WidgetRef」 から 「provider」を呼び出し、状態を見ることができる、「state」の変更はできない
* Notifier ... 「state」の変更を行う、「ConsumerWidget」から呼び出される

### 扱うデータ
* 基本データ ... int、String　など
* クラスデータ ... List、Class など
* Futureデータ ... APIからのレスポンス取得、DBの取得結果 など
* Streamデータ ... 定期的なデータ、突然の通知など

### Notifier、Providerの種類と扱うデータ
| 　| Notifier | Provider |
| ---- | ---- | ---- |
| 基本・クラスデータ | Notifier | NotifierProvider |
| Future・Streamデータ | AsyncNotifier | AsyncNotifierProvider |


## Riverpodに関する参考サイト
* [riverpod.dev / (Async)NotifierProvider](https://riverpod.dev/ja/docs/providers/notifier_provider)
* [Flutterの初期アプリをRiverpod Generatorで状態管理してみた](https://dev.classmethod.jp/articles/flutter-riverpod-generator-state-management/)
* [Flutterで次のレベルへ！中級者向けRiverpod NotifierProviderの使い方](https://zenn.dev/honda9135/articles/7467922d162046#notifierprovider%E3%81%A8%E3%81%AF)
* [Notifierの使い方](https://zenn.dev/joo_hashi/books/2c6c47e3d79b63/viewer/5dd26b#%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%83%A6%E3%83%BC%E3%82%B9%E3%82%B1%E3%83%BC%E3%82%B9)
* [【Flutter】Riverpod 2.0 の Notifier と riverpod_generator の解説](https://zenn.dev/10_tofu_01/articles/try_riverpod_generator#notifier-%E3%82%92-generate)
* [Riverpod (リバーポッド) 完全ガイド #Flutter 1/4](https://www.youtube.com/watch?v=0HVru4WtdWo&t=4s)