import 'package:flutter/material.dart';
import 'package:maripedia/utils/constants.dart';
import '../../models/models.dart';

class ShowWeedInfo extends StatelessWidget {
  final Marijuana marijuana;

  const ShowWeedInfo({Key key, @required this.marijuana}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40, left: 15, right: 15),
              height: 150,
              child: Text(
                "${marijuana.name}",
                style: TextStyle(fontFamily: 'RocknRollOne', fontSize: 35),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: appBarColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
