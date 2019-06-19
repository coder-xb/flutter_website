import 'dart:io';
import 'dart:convert';

import './data.dart';

main() async {
  HttpServer httpApp = await HttpServer.bind('192.168.199.191', 8080);

  await for (HttpRequest req in httpApp) _handleMsg(req);
}

// 分发请求数据
void _handleMsg(HttpRequest req) {
  try {
    switch (req.method) {
      case 'GET':
        _handleGET(req);
        break;
      case 'POST':
        break;
    }
  } catch (e) {
    print('服务端异常...$e');
  }
}

// 处理GET请求
void _handleGET(HttpRequest req) {
  switch (req.uri.path) {
    case '/news':
      req.response
        ..statusCode = _ReqStatus._success
        ..write(json.encode(news))
        ..close();
      break;
    case '/product':
      var page = req.uri.queryParameters['page'];
      print(page);
      req.response
        ..statusCode = _ReqStatus._success
        ..write(json.encode(product))
        ..close();
      break;
    case '/contact':
    // int page = req.uri.queryParameters['page'] as int;
      String msg = req.uri.queryParameters['msg'];
      print('用户留言为：$msg');
      req.response
        ..statusCode = _ReqStatus._success
        ..write('提交成功：$msg')
        ..close();
      break;
  }
}

// 处理POST请求
void _handlePOST(HttpRequest req) {}

// Http请求状态码
abstract class _ReqStatus {
  static const int _continue = 100; // 继续执行
  static const int _switchingProtocols = 101; // 交换协议

  static const int _success = 200; // 请求成功
  static const int _created = 201; // 请求已创建
  static const int _accepted = 202; // 请求得到认可
  static const int _nonAuthoritaInfomation = 203; // 非授权信息
  static const int _noContent = 204; // 没有内容
  static const int _resetContent = 205; // 重置内容
  static const int _partialContent = 206; // 部分内容

  static const int _multipleChoices = 300; // 多项选择
  static const int _movedPermanently = 301; // 永久迁移
  static const int _found = 302; // 已发现
  static const int _movedTemporarily = 302; // 临时迁移 Common alias for found.
  static const int _seeOther = 303; // 查看其他
  static const int _notModified = 304; // 未修改的
  static const int _useProxy = 305; // 使用代理
  static const int _temporartRedirect = 307; // 暂时重定向

  static const int _badRequest = 400; // 请求失败
  static const int _unauthorized = 401; // 没有授权
  static const int _paymentRequired = 402; // 要求付款
  static const int _forbidden = 403; // 禁止请求
  static const int _notFound = 404; // 请求未找到
  static const int _methodNotAllowed = 405; // 请求方式不允许
  static const int _notAcceptable = 406; // 不接受的请求
  static const int _proxyAuthenticationRequired = 407; // 需要代理身份认证
  static const int _requestTimeout = 408; // 请求超时
  static const int _conflict = 409; // 请求冲突
  static const int _gone = 410; // 请求过时
  static const int _lengthRequired = 411; // 长度要求
  static const int _requestEntityTooLarge = 413; // 请求内容过大
  static const int _requestUriTooLong = 414; // 请求地址过长
  static const int _unsupportedMediaType = 415; // 非支持的媒体类型
  static const int _requestedRangeNotSatisfiable = 416; // 请求范围不可满足
  static const int _expectationFailed = 417; // 期望失败
  static const int _upgradeRequired = 426; // 升级要求

  static const int _internalServerError = 500; // 内部服务器错误
  static const int _notImplemented = 501; // 服务器未实现
  static const int _badGateway = 502; // 错误的网关
  static const int _gatewayTimeout = 504; // 网关超时
  static const int _httpVersionNotSupported = 505; // Http版本不支持
  static const int _networdConnectTimeoutError = 599; // 连接超时

}
