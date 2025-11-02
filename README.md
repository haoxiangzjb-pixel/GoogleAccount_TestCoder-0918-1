# Dart 网络数据获取器

这个Dart程序演示了如何使用异步函数获取网络数据并将其保存到随机命名的.dart文件中。

## 功能特点

- 使用Dart内置的HttpClient进行网络请求
- 异步处理网络数据获取
- 生成随机文件名保存数据
- 包含错误处理机制

## 代码说明

`network_data_fetcher.dart` 文件包含以下主要功能：

1. `fetchAndSaveNetworkData(String url)` - 异步获取网络数据并保存到文件
2. `generateRandomFileName()` - 生成随机的.dart文件名
3. `main()` - 示例用法

## 使用方法

```bash
dart network_data_fetcher.dart
```

程序将从指定的URL获取数据，并将其保存到一个随机命名的.dart文件中。

## 依赖

此程序仅使用Dart内置库，无需外部依赖包。