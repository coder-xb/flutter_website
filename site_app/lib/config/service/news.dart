import 'dart:convert';
import 'package:http/http.dart' as Http;

import './ip.dart';

// 获取新闻数据
Future getNews() async {
  var res = await Http.get('http://${IPConfig.IP}:${IPConfig.PORT}/news');
  return jsonDecode(res.body)['items'] as List;
}
