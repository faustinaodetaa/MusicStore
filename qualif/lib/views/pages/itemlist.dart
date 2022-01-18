import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualif/main.dart';
import 'package:qualif/models/items.dart';
import 'package:qualif/views/pages/home.dart';
import 'package:qualif/views/pages/itemdetail.dart';
import 'package:qualif/utils/globals.dart' as globals;
import 'package:qualif/views/pages/login.dart';

class ItemPage extends StatelessWidget {
  var _ctx;

  void _onPressed(Items item) {
    Navigator.push(
      _ctx,
      MaterialPageRoute(builder: (builder) {
        return ItemDetailPage(item.img, item.name, item.desc, item.price);
      }),
    );
  }

  Widget _buildWidget(Items item) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: 250, maxWidth: 50, minHeight: 200, minWidth: 50),
          child: Image.asset(
            'assets/${item.img}',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item.name),
        subtitle: Text(item.price),
        trailing: ElevatedButton(
          child: Text('Detail Product'),
          onPressed: () => _onPressed(item),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple[100],
            primarySwatch: Colors.purple,
            fontFamily: 'Quicksand'),
        home: Scaffold(
            appBar: AppBar(
                title: Row(
                  children: [
                    Icon(Icons.music_note_rounded),
                    Text(
                      'YAMAHA MUSIC',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                titleSpacing: -10),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Row(children: [
                      Icon(Icons.person),
                      Text(
                        'Welcome, ' + globals.currUser.toString() + '!',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ]),
                  ),
                  ListTile(
                    title: TextButton(
                      child: Text('Home'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return HomePage();
                        }));
                      },
                    ),
                  ),
                  ListTile(
                    title: TextButton(
                      child: Text('Shop'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return ItemPage();
                        }));
                      },
                    ),
                  ),
                  ListTile(
                    title: TextButton(
                      child: Text('Logout'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return LoginPage();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
                children: globals.items.map((e) => _buildWidget(e)).toList())));
  }
}
