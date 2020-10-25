import 'package:flutter/material.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Orders extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Order List',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Orders'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int present = 0;
  int perPage = 15;

  final originalItems = List<String>.generate(10000, (i) => "Order $i");
  var items = List<String>();

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(originalItems.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text(widget.title), backgroundColor: MaterialColors.blue),
      body: ListView.builder(
        itemCount:
            (present <= originalItems.length) ? items.length + 1 : items.length,
        itemBuilder: (context, index) {
          return (index == items.length)
              ? Container(
                  color: MaterialColors.blue,
                  child: FlatButton(
                    child: Text("Show more orders",
                        style: TextStyle(color: MyColors.white)),
                    onPressed: () {
                      setState(() {
                        if ((present + perPage) > originalItems.length) {
                          items.addAll(originalItems.getRange(
                              present, originalItems.length));
                        } else {
                          items.addAll(originalItems.getRange(
                              present, present + perPage));
                        }
                        present = present + perPage;
                      });
                    },
                  ),
                )
              : ListTile(
                  title: Text('${items[index]}'),
                );
        },
      ),
    );
  }

  Future<bool> handleBackPressed() {
    return Future.value(true);
  }
}
