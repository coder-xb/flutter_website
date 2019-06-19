import 'package:flutter/material.dart';
import '../../config/index.dart';
class ContactPage extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<ContactPage> {
  TextEditingController _editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('联系我们'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/company.jpg',
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 20),
              width: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _editingController,
                    decoration: InputDecoration(
                      hintText: '请输入留言内容',
                      labelText: '留言内容',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.message),
                    ),
                    maxLength: 150,
                  ),
                  SizedBox(
                    width: 220,
                    height: 44,
                    child: RaisedButton(
                      child: Text(
                        '给我们留言',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      color: Colors.blueGrey,
                      colorBrightness: Brightness.light,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: _commit,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _commit() async {
    if (_editingController.text.length == 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('请输入留言内容！'),
            ),
      );
    } else {
      var info = await contactUs(_editingController.text);
      print(info);
    }
  }
}
