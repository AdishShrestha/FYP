import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rent_room/views/login_page.dart';
import 'package:rent_room/views/registerAddressPage.dart';
import 'package:rent_room/widgets/clippers.dart';
import 'package:rent_room/widgets/constants.dart';
import 'package:rent_room/widgets/raised_button.dart';
import 'dart:async';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  int group = 1;
  TextEditingController fullNamectrl, emailctrl, passctrl, confirmpassctrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNamectrl = new TextEditingController();
    emailctrl = new TextEditingController();
    passctrl = new TextEditingController();
    confirmpassctrl = new TextEditingController();
  }

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
                  SizedBox(height: 10.0),
                  Text(
                    'Register',
                    style: KLabelstyle.copyWith(
                        color: Colors.white, fontSize: 22.0),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 55.0,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 15.0),
                  buildTextField(
                    context,
                    textController: fullNamectrl,
                    label: 'Full Name',
                    hintText: 'Type your Full Name',
                    icon: Feather.user,
                  ),
                  SizedBox(height: 15.0),
                  buildTextField(
                    context,
                    textController: emailctrl,
                    label: 'Email Address',
                    hintText: 'Type your Email Address',
                    icon: Feather.mail,
                  ),
                  SizedBox(height: 15.0),
                  buildTextField(
                    context,
                    textController: passctrl,
                    label: 'Password',
                    hintText: 'Type your Password',
                    icon: Feather.lock,
                    isPassword: true,
                  ),
                  SizedBox(height: 15.0),
                  buildTextField(
                    context,
                    textController: confirmpassctrl,
                    label: 'Confirm Password',
                    hintText: 'Type your Confirm Password',
                    icon: Feather.lock,
                    isPassword: true,
                  ),
                  // SizedBox(height: 15.0),
                  // buildRadioButton(
                  //   context,
                  //   label: 'Gender',
                  // ),
                ],
              ),
              button: MyRaisedButton(
                onTap: continueOnTap,
                label: 'Continue',
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have an Account?",
                  style: KSubtitlestyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: navigateToSignInOnTap,
                  child: Text(
                    "Sign In",
                    style: KTitlestyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kBackground,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildMainSection(BuildContext context, {Widget child, Widget button}) {
    return Container(
      width: double.infinity,
      height: 650.0,
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

  void continueOnTap() {
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterAddressPage(),
      ),
    );
    //call register method.
    register();
  }

  buildTextField(
    BuildContext context, {
    @required String label,
    String hintText,
    IconData icon,
    bool isPassword = false,
    TextEditingController textController,
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
          controller: textController,
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

  buildRadioButton(
    BuildContext context, {
    String label,
    IconData icon,
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
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: group,
              activeColor: Colors.white,
              onChanged: (val) {
                setState(() {
                  group = val;
                });
              },
            ),
            Text(
              'Male',
              style: KLabelstyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Radio(
              value: 2,
              groupValue: group,
              activeColor: Colors.white,
              onChanged: (val) {
                setState(() {
                  group = val;
                });
              },
            ),
            Text(
              'Female',
              style: KLabelstyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
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

  void register() async {
    var url = "https://oreg7.000webhostapp.com/register1.php";
    var data = {
      "fullname": fullNamectrl.text.toString(),
      "email": emailctrl.text.toString(),
      "pass": passctrl.text.toString(),
      "confirm_pass": confirmpassctrl.text.toString(),
    };

    //var res = await http.post(Uri.parse(url), body: data);
     var res = await http.post(Uri.parse(url), body:json.encode(data));
     var msg = jsonDecode(res.body);

    //if (jsonDecode(res.body) == "Account already exists") {
    
      if(res.statusCode == 200){

      //showToast(msg: "Account already exists. Please Login.");
      showToast(msg: "Account Created.");
      
    } else {
      if (jsonDecode(res.body) == "true") {
        showToast(msg: "Account Created.");
      } else {
        showToast(msg: "Error");
      }
    }
  }
}
