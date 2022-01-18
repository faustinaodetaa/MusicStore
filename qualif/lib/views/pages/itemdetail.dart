import 'package:flutter/material.dart';
import 'package:qualif/models/comments.dart';
import 'package:qualif/models/items.dart';
import 'package:qualif/utils/globals.dart' as globals;

class ItemDetailPage extends StatefulWidget {
  ItemDetailPage(this.img, this.name, this.desc, this.price);
  String img, name, desc, price;
  @override
  State<StatefulWidget> createState() {
    return ItemDetailPageState(img, name, desc, price);
  }
}

class ItemDetailPageState extends State<ItemDetailPage> {
  var _ctx;
  var _comment = TextEditingController();
  ItemDetailPageState(this.img, this.name, this.desc, this.price);
  String img, name, desc, price;
  List<Comments> comments = [];

  void _onPressed([context]) {
    if (_comment.text == "") {
      ScaffoldMessenger.of(_ctx)
          .showSnackBar(SnackBar(content: Text('Please insert your comment')));
    } else {
      setState(() {
        globals.comments.add(Comments(globals.currUser, name, _comment.text));
        _comment.clear();
      });
    }
  }

  Widget _buildWidget(Comments comments) {
    for (var i = 0; i < globals.comments.length; i++) {
      if (comments.item == name) {
        return Card(
          child: ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 30,
                minWidth: 30,
                maxHeight: 40,
                maxWidth: 40,
              ),
            ),
            title: Text(comments.user),
            subtitle: Text(comments.comment),
            trailing: Icon(Icons.comment),
          ),
        );
      }
    }
    return Card();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                      text: 'Product Details',
                      icon: Icon(Icons.insert_emoticon)),
                  Tab(text: 'Comments', icon: Icon(Icons.comment)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Column(children: [
                  Image(
                    image: AssetImage('assets/$img'),
                    width: 250,
                    height: 250,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(desc,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  Text(price),
                  TextField(
                    decoration:
                        InputDecoration(hintText: 'Insert Your Comment Here'),
                    controller: _comment,
                  ),
                  ElevatedButton(
                      onPressed: () => _onPressed(context),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.black),
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.purple[100]))
                ]),
                ListView(
                    children:
                        globals.comments.map((e) => _buildWidget(e)).toList())
              ],
            )));
  }
}
