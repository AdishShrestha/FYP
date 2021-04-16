import 'package:flutter/material.dart';
import 'package:rent_room/widgets/constants.dart';

class MyRaisedButton extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final double height;
  final double width;
  final Color color;
  final Color labelColor;

  const MyRaisedButton({
    Key key,
    @required this.onTap,
    @required this.label,
    this.height = 45.0,
    this.width = double.infinity,
    this.color = kBackground,
    this.labelColor = Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onTap,
        color: color,
        child: Text( 
          label,
          style: KLabelstyle,
        ),
      ),
    );
  }
}
