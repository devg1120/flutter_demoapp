import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoApp(),
    );
  }
}

//アプリ全体
class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sample Items",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ItemListPage(),
    );
  }
}

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<String> itemList = [];
  static final String dummyImageURL =
      "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/495652/profile-images/1568357938";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item List"),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ObjectKey(itemList[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                itemList.removeAt(index);
              });
            },
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: Card(
              child: ListTile(
                title: Text(itemList[index]),
                leading: Image.network(dummyImageURL),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ItemAddPage();
              },
            ),
          );

          if (newListText != null) {
            setState(
              () => {
                itemList.add(newListText),
              },
            );
          }
        },
      ),
    );
  }
}

class ItemAddPage extends StatefulWidget {
  @override
  _ItemAddPageState createState() => _ItemAddPageState();
}

class _ItemAddPageState extends State<ItemAddPage> {
  String itemTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: Container(
        padding: EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Input your new Item!",
                  border: OutlineInputBorder(),
                ),
                onChanged: (String newItemTitle) {
                  setState(
                    () => {
                      itemTitle = newItemTitle,
                    },
                  );
                },
              ),
              width: double.infinity,
              margin: EdgeInsets.all(1),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(1),
              child: RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  Navigator.of(context).pop(itemTitle);
                },
                child: Text(
                  "Add!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(1),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Abort",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
