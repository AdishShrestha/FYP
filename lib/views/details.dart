import 'package:flutter/material.dart';
import 'package:rent_room/widgets/clippers.dart';
import 'package:rent_room/widgets/constants.dart';

class Details extends StatefulWidget {
  String name;
  Details({this.name});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: Text(widget.name),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  buildMainSection(BuildContext context, {Widget child, Widget button}) {
    return Container(
      width: double.infinity,
      height: 550.0,
      child: Stack(
        children: [
          ClipPath(
            clipper: BottomContainerClipper(),
            child: Container(
              padding: EdgeInsets.fromLTRB(
                kDefaultmargin,
                50.0,
                kDefaultmargin,
                0,
              ),
              color: kBackground,
              child: child,
            ),
          ),
          Positioned(
            left: 50.0,
            right: 50.0,
            bottom: 0.0,
            child: button,
          )
        ],
      ),
    );
  }
}
