import 'package:http/http.dart' as Http;

import './ip.dart';

// 给我们留言
Future contactUs(String msg) async {
  var res = await Http.get('http://${IPConfig.IP}:${IPConfig.PORT}/contact?msg=$msg');
  return res.body;
}
