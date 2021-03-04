import 'package:flutter/material.dart';

import '../pages/pages.dart';
import '../utils/utils.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _map = [
      {
        'title': 'Weeds',
        'desc': 'List all Weeds',
        'route': WeedsPage(),
      },
    ];

    Widget buttonWidget(Map<String, dynamic> map) {
      return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(5),
        child: ListTile(
          title: Text(
            '${map['title']}',
            textAlign: TextAlign.left,
          ),
          subtitle: Text(
            '${map['desc']}',
            textAlign: TextAlign.left,
          ),
          shape: Border.all(
            width: 10.0,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
          trailing: IconButton(
            icon: Icon(Icons.navigate_next_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => map['route'],
                ),
              );
            },
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBarColor,
        elevation: 0,
        title: Text("Select one option"),
      ),
      body: ListView.builder(
        itemCount: _map.length,
        itemBuilder: (context, index) {
          return buttonWidget(_map[index]);
        },
      ),
    );
  }
}
