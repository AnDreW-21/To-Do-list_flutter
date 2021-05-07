import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> toDoList = ["play football", "read a book", 'ride my bike'];
  TextEditingController t=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'List',
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            height: 10,
            //color: Colors.grey,
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(toDoList[index]),
                      child:ListTile( title: Text(
                    '${toDoList[index]}',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                      ),
                  onDismissed:(directions){
                      setState(() {
                        toDoList.removeAt(index);
                      });
                  } ,
                  );
                },
                separatorBuilder: (BuildContext context, int indx) => Divider(
                      color: Colors.black87,

                    ),
                itemCount: toDoList.length),
          ),
        ),
        TextField(
          controller: t,
          decoration: InputDecoration(labelText: 'add your tasks(Swipe left to delete)')
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            toDoList.add(t.text);
            t.clear();
          });
        },
    backgroundColor: Colors.amber,
    child: Icon(Icons.send_rounded),
      ),
    );
  }
}
