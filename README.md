# NewsApp

## About
In this application Showing the latest Indonesian news Using the API from newsapi.org with webview and Use Cubit for design pattern.

## Features:
- Show the latest Indonesian news
- News search
- News grouping by category
- Save news

## librarys used
- [http](https://pub.dev/packages/http)
- [webview_flutter](https://pub.dev/packages/webview_flutter)
- [equatable](https://pub.dev/packages/equatable)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- etc.

## API Docs
[NewsAPI](https://newsapi.org/docs)

## Project Structure
```
-assets/
    |--fonts/               -> Any fonts will we use
        |--font_name
    |--images               -> Offline images like placeholder, etc.
-lib/
    |--core/
        |--config           -> Static variable
        |--error            -> Error handling with dio Interceptors
        |--network          -> Check internet status (connected or disconnect)
        |--observer         -> Bloc Observer
        |--utils            -> Others like custom extension, etc.
    |--data/
        |--datasources      -> Data sources (remote and local)
        |--models           -> App models
        |--repositories     -> To determine where the data is taken from (Local or remote)
    |--presentation/
        |--cubit            -> State management
        |--pages            -> Part of screen
        |--screens          -> Full view of app
        |--widgets          -> Reusable widgets
    |--injection_container  -> Depedency Injection
-test/                      -> Unit test
    |--fixtures/            -> Data Dummy for unit test
```
