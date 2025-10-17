# 网络数据获取和保存程序

这个Dart程序演示了如何异步获取网络数据并将其保存到随机命名的.dart文件中。

## 功能

- 异步获取指定URL的网络数据
- 生成随机文件名以避免冲突
- 将获取的数据保存到.dart文件中
- 包含错误处理机制

## 文件说明

- `network_data_fetcher.dart`: 主程序文件，包含异步获取网络数据的函数
- `pubspec.yaml`: 项目依赖配置文件

## 使用方法

1. 确保已安装Dart SDK
2. 在项目目录下运行 `dart pub get` 安装依赖
3. 运行程序：`dart network_data_fetcher.dart`

## 代码说明

### 主要函数

`fetchNetworkDataAndSave(String url, {String directory = '.'})` 
- 异步获取指定URL的数据
- 生成随机文件名
- 将数据保存到指定目录下的随机命名.dart文件中
- 返回生成文件的路径

### 随机文件名生成

`_generateRandomFileName()` 函数使用随机字符生成10位长度的文件名，以确保文件名唯一性。

## 依赖

此项目依赖于 `http` 包来处理HTTP请求，已在pubspec.yaml中声明。

## 示例

程序包含一个示例，演示如何获取JSONPlaceholder API的数据并保存。