import 'dart:convert';
import 'package:http/http.dart' as Http;

import './ip.dart';

Future getProduct({int page = 0}) async {
  var res = await Http.get('http://${IPConfig.IP}:${IPConfig.PORT}/product?page=$page');
  return jsonDecode(res.body)['items'] as List;
}
