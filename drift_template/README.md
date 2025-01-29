# flutter_template

A new Flutter project.

## Getting Started

## ビルドコマンド

* dart run build_runner build --delete-conflicting-outputs
* flutter pub run build_runner build --delete-conflicting-outputs

### 単発で生成する場合

* dart run build_runner build -d

### 対象のファイルを監視し、変更があった際に自動で生成させる場合（こっちがオススメ）

* dart run build_runner watch -d

## 構成想定

root
├── application
│   ├── service（ApplicationService）
│   └── sharedservice（サービス間で使いたいサービス）
├── domain
│   ├── model（値オブジェクトなどを格納したオブジェクト）
│   ├── repository（インターフェース）
│   ├── service（DomainService）
│   └── value（値オブジェクトや区分オブジェクト）
├── infra（repositoryの実態）
│   ├── composite（複数のdatasourceやexternalapiの結果を結合したりする場合に使用）
│   ├── repository（DBなど）
│   ├── externalapi（外部APIなど）
│   ├── transfer（外部ストレージなど）
|   └── states（状態管理(Riverpod)）
└── presentation
    ├── controller
    ├── secutiry（認証関連やCSRFトークンなどの処理）
    └── interceptor（コントローラー共通処理）

## ページ

* 機能名(フォルダ)
  * index.dart
  * controller.dart
  * form.dart

## スニペット

<https://marketplace.visualstudio.com/items?itemName=robert-brunhage.flutter-riverpod-snippets>

| ショートカット | 説明 |
|--------------|------|
| consumer | Consumerウィジェットを作成する |
| stlessConsumer | ConsumerStatelessウィジェットを作成する |
| stfulConsumer | ConsumerStatefulウィジェットを作成する |
| stlessHookConsumer | ステートレスHookConsumerウィジェットを作成する |
| stfulHookConsumer | ステートフルHookConsumerウィジェットを作成する |
| provider | シンプルなリバーポッドプロバイダーを作成する |
| providerFamily | ファミリー修飾子を持つプロバイダを作成します |
| futureProvider | FutureProviderを作成する |
| futureProviderFamily | ファミリー修飾子を持つFutureProviderを作成します |
| streamProvider | StreamProviderを作成する |
| streamProviderFamily | ファミリー修飾子を持つStreamProviderを作成します |
| changeNotifierProvider | ChangeNotifierProvider を作成します |
| changeNotifierProviderFamily | ファミリー修飾子を持つChangeNotifierProviderを作成します |
| stateProvider | StateProvider を作成する |
| stateProviderFamily | ファミリー修飾子を持つStateProviderを作成します |
| stateNotifierProvider | StateNotifierプロバイダーを作成します |
| stateNotifierProviderFamily | ファミリー修飾子を持つStateNotifierProviderを作成します |
| stateNotifier | StateNotifierを拡張し、型を編集できるクラスを作成します。 |
| asyncNotifierProvider | AsyncNotifierProviderを作成する |
| asyncNotifierProviderFamily | ファミリー修飾子を持つ AsyncNotifierProvider を作成する |
| asyncNotifier | AsyncNotifierクラスを作成する |
| asyncNotifierFamily | ファミリーパラメータを使用して AsyncNotifier を作成する |
| notifierProvider | NotifierProviderを作成する |
| notifierProviderFamily | ファミリー修飾子を持つ NotifierProvider を作成する |
| notifier | 通知クラスを作成する |
| notifierFamily | ファミリーパラメータを使用して通知を作成する |
| streamNotifierProvider | StreamNotifierProviderを作成する |
| streamNotifierProviderFamily | ファミリー修飾子を持つ StreamNotifierProvider を作成する |
| streamNotifier | StreamNotifierクラスを作成する |
| streamNotifierFamily | ファミリーパラメータを使用してStreamNotifierを作成する |
| listen | プロバイダーリスナブルを作成する |
| riverpod | シンプルなプロバイダを作成する |
| riverpodKeepAlive | シンプルなキープアライブプロバイダを作成する |
| riverpodFuture | FutureProviderを作成する |
| riverpodFutureKeepAlive | 存続可能なFutureProviderを作成する |
| riverpodStream | StreamProviderを作成する |
| riverpodStreamKeepAlive | キープアライブStreamProviderを作成します |
| riverpodClass | クラスプロバイダを作成する |
| riverpodClassKeepAlive | キープアライブクラスプロバイダを作成する |
| riverpodAsyncClass | 非同期クラスプロバイダーを作成する |
| riverpodAsyncClassKeepAlive | キープアライブ非同期クラスプロバイダーを作成します |
| riverpodStreamClass | ストリームクラスプロバイダーを作成します |
| riverpodStreamClassKeepAlive | キープアライブストリームクラスプロバイダーを作成します |
| riverpodPart | Riverpodの部品明細書を作成する |
