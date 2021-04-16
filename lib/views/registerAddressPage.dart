import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rent_room/views/login_page.dart';
import 'package:rent_room/widgets/clippers.dart';
import 'package:rent_room/widgets/constants.dart';
import 'package:rent_room/widgets/raised_button.dart';

class RegisterAddressPage extends StatefulWidget {
  @override
  _RegisterAddressPageState createState() => _RegisterAddressPageState();
}

class _RegisterAddressPageState extends State<RegisterAddressPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildMainSection(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'V-Room',
                      style: KLabelstyle.copyWith(
                        color: Colors.white,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),

                  Text(
                    'Address',
                    style: KLabelstyle.copyWith(
                        color: Colors.white, fontSize: 22.0),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 55.0,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 25.0),
                  buildTextField(
                    context,
                    label: 'Contact Number',
                    hintText: 'Type your Contact Number',
                    icon: Feather.phone,
                  ),
                  SizedBox(height: 25.0),
                  buildTextField(
                    context,
                    label: 'Country',
                    hintText: 'Type your Country',
                    icon: Feather.flag,
                  ),
                  SizedBox(height: 25.0),
                  buildTextField(
                    context,
                    label: 'City',
                    hintText: 'Type your City',
                    icon: Feather.pocket,
                  ),
                ],
              ),
              button: MyRaisedButton(
                onTap: registerOnTap,
                label: 'Register',
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildMainSection(BuildContext context, {Widget child, Widget button}) {
    return Container(
      width: double.infinity,
      height: 600.0,
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

  buildTextField(
    BuildContext context, {
    @required String label,
    String hintText,
    IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Text(
            label,
            style: KLabelstyle.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        TextField(
          cursorColor: Colors.white,
          obscureText: isPassword ? _obscureText : false,
          style: KSubtitlestyle.copyWith(color: Colors.white),
          keyboardType:
              isPassword ? TextInputType.text : TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: KSubtitlestyle.copyWith(
              color: Colors.white70,
            ),
            contentPadding: EdgeInsets.only(top: isPassword ? 15.0 : 0.0),
            icon: Icon(icon, color: Colors.white),
            suffixIcon: isPassword
                ? InkWell(
                    onTap: iconVisibilityOnTap,
                    child: Icon(
                      _obscureText ? Feather.eye_off : Feather.eye,
                      color: Colors.white,
                    ),
                  )
                : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void iconVisibilityOnTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void navigateToSignInOnTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void registerOnTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
