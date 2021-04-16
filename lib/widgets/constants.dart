import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const kBlack = Color(0xFF002140);
const kRedAccent = Color(0xFF00736b);
const kRed = Color(0xFFD81106);
const kBlue = Color(0xFF1D97D0);
const kWhite = Color(0xFFFCFCFC);
//const kBackground = Color.fromRGBO(147, 181, 237, 1);
const kBackground = Color.fromRGBO(207, 83, 0, 1);
const kGoogleColor = Color.fromRGBO(66, 133, 244, 1);

const KTitlestyle = TextStyle(
  fontSize: 18.0,
  fontFamily: "Gilroy",
  fontWeight: FontWeight.bold,
  color: kBlack,
);

const KSubtitlestyle = TextStyle(
  fontSize: 15.0,
  fontFamily: "Gilroy",
  color: Colors.black45,
);

const KButtonstyle = TextStyle(
  fontSize: 16.0,
  fontFamily: "Gilroy",
  color: kWhite,
);

const KDropdownstyle = TextStyle(
  fontSize: 15.0,
  fontFamily: "Gilroy",
  color: kBlack,
);

const KRatingstyle = TextStyle(
  fontSize: 12.0,
  fontFamily: "Gilroy",
  color: kWhite,
  fontWeight: FontWeight.bold,
);

const KTrailingstyle = TextStyle(
  fontSize: 13.0,
  fontFamily: "Gilroy",
  decoration: TextDecoration.underline,
  color: Colors.black45,
);

const KLabelstyle = TextStyle(
  fontSize: 18.0,
  fontFamily: "Gilroy",
  fontWeight: FontWeight.bold,
  color: kWhite,
);

//margins

double kDefaultmargin = 18.0;

Future showToast(
    {@required String msg, Color backgroundColor, Color textColor}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16.0,
    gravity: ToastGravity.CENTER,
    backgroundColor: backgroundColor ?? kBlue,
    textColor: textColor ?? Colors.white,
  );
}
