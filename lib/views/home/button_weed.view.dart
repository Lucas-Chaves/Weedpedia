import 'package:flutter/material.dart';
import 'package:maripedia/models/models.dart';
import 'package:maripedia/pages/pages.dart';

class ButtonWeed extends StatelessWidget {
  final Marijuana marijuana;

  const ButtonWeed({Key key, this.marijuana}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(5),
      child: ListTile(
        title: Text(
          '${marijuana.name}',
          textAlign: TextAlign.left,
        ),
        subtitle: Text(
          '${marijuana.race}',
          textAlign: TextAlign.left,
        ),
        leading: Text(
          '${marijuana.id}',
          textAlign: TextAlign.center,
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
                builder: (context) => WeedsPage(),
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
}
