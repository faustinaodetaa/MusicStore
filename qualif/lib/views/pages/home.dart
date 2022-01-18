import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:qualif/utils/globals.dart' as globals;
import 'package:qualif/views/pages/itemlist.dart';
import 'package:qualif/views/pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var _images = [
    'assets/drum.png',
    'assets/piano.png',
    'assets/violin.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globals.darkTheme
          ? ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              fontFamily: 'Quicksand')
          : ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.purple[100],
              primarySwatch: Colors.purple,
              fontFamily: 'Quicksand'),
      home: Scaffold(
        appBar: AppBar(
            actions: [
              PopupMenuButton(itemBuilder: (context) {
                return ['Toggle Theme'].map((e) {
                  return PopupMenuItem(
                      child: TextButton(
                    child: Text('Change Theme'),
                    onPressed: () {
                      setState(() {
                        globals.darkTheme = !globals.darkTheme;
                      });
                    },
                  ));
                }).toList();
              })
            ],
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
          children: [
            Image.asset('assets/logo.png', width: 200, height: 150),
            CarouselSlider(
              items: [
                Image(
                  image: AssetImage(_images[0]),
                ),
                Image(
                  image: AssetImage(_images[1]),
                ),
                Image(
                  image: AssetImage(_images[2]),
                ),
              ],
              options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2)),
            ),
            Text(
                "Yamaha Corporation is a Japanese multinational corporation and conglomerate with a very wide range of products and services. It is one of the constituents of Nikkei 225 and is the world's largest piano manufacturing company.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
