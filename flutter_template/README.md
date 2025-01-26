# flutter_template

A new Flutter project.

## Getting Started

## ビルドコマンド

* dart run build_runner build --delete-conflicting-outputs

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
