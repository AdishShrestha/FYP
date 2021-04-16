import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rent_room/views/home.dart';
import 'package:rent_room/views/register_page.dart';
import 'package:rent_room/widgets/clippers.dart';
import 'package:rent_room/widgets/constants.dart';
import 'package:rent_room/widgets/raised_button.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  TextEditingController emailctrl, passctrl;

  String errormsg = "";
  bool error = false, showprogress = false;
  String email = "", pass = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailctrl = new TextEditingController();
    passctrl = new TextEditingController();
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
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'User Login',
                      style: KLabelstyle.copyWith(
                        color: Colors.black87,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    'Sign In',
                    style: KTitlestyle.copyWith(
                        color: Colors.black87, fontSize: 22.0),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 35.0,
                    height: 2.0,
                    color: Colors.black87,
                  ),
                  SizedBox(height: 25.0),
                  buildTextField(
                    context,
                    textController: emailctrl,
                    label: 'Email',
                    hintText: 'Type your Email Address',
                    icon: Feather.mail,
                  ),
                  SizedBox(height: 25.0),
                  buildTextField(
                    context,
                    textController: passctrl,
                    label: 'Password',
                    hintText: 'Type your Password',
                    icon: Feather.lock,
                    isPassword: true,
                  ),
                  SizedBox(height: 25.0),
                ],
              ),
              button: MyRaisedButton(
                onTap: loginCheck,
                color: Colors.grey[600],
                label: 'Login',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have an Account?",
                  style: KSubtitlestyle.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                InkWell(
                  onTap: navigateToResgisterOnTap,
                  child: Text(
                    "Register",
                    style: KTitlestyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kBackground,
                    ),
                  ),
                )
              ],
            ),
            // SizedBox(height: 20.0),
            // Text("Or Sign In with",
            //     style: KSubtitlestyle.copyWith(
            //         fontWeight: FontWeight.bold, color: Colors.black)),
            // SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       borderRadius: BorderRadius.circular(8.0),
            //       onTap: googleSignInTap,
            //       child: Container(
            //         width: 300.0,
            //         height: 50.0,
            //         padding: EdgeInsets.all(8.0),
            //         // decoration: BoxDecoration(
            //         //   border: Border.all(color: kGoogleColor),
            //         //   borderRadius: BorderRadius.circular(8.0),
            //         // ),
            //         child: Image.asset(
            //           'assets/googleSignIn.png',
            //           height: 30.0,
            //           width: 30.0,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
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

  buildTextField(
    BuildContext context, {
    @required String label,
    String hintText,
    IconData icon,
    bool isPassword = false,
    TextEditingController textController,
  }) {
    //final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Text(label, style: KLabelstyle.copyWith(color: Colors.black87)),
        ),
        TextField(
          controller: textController,
          cursorColor: Colors.black87,
          obscureText: isPassword ? _obscureText : false,
          style: KSubtitlestyle.copyWith(color: Colors.black,),
          keyboardType:
              isPassword ? TextInputType.text : TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: KSubtitlestyle.copyWith(
              color: Colors.white70,
            ),
            contentPadding: EdgeInsets.only(top: isPassword ? 15.0 : 0.0),
            icon: Icon(icon, color: Colors.black87),
            suffixIcon: isPassword
                ? InkWell(
                    onTap: iconVisibilityOnTap,
                    child: Icon(
                      _obscureText ? Feather.eye_off : Feather.eye,
                      color: Colors.black87,
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

  void signInOnTap() {
    //Get.offAll(RegisterPage());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  void navigateToResgisterOnTap() {
    //Get.to(RegisterPage());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(
      
        ),
      ),
    );
  }

  // void googleSignInTap() {
  //   showToast(msg: 'Sign In with Google clicked.');
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (context) => RegisterPage(),
  //   //   ),
  //   // );
  // }

  void loginCheck() async {
    var url = "https://oreg7.000webhostapp.com/login.php";
    var data = {
      "email": emailctrl.text,
      "pass": passctrl.text,
    };

    //var res = await http.post(Uri.parse(url), body: data);
    var res = await http.post(Uri.parse(url), body: json.encode(data));
    var msg = jsonDecode(res.body);
    //print(msg);
    //print("adish");

    //if (jsonDecode(res.body) == "account already created.") {

    if (res.statusCode == 200) {
      if (msg == "correct password") {
        showToast(msg: "Signed In");

        signInOnTap();
      } 
      if(msg == "incorrect password"){
        showToast(msg: "Incorrect password");
      }
      if (msg == "send all parameters"){
        showToast(msg: "Account isn't signed up.");
        //print(jsonDecode(res.body));
      }
    }
  }

  // void loginCheck() async {
  //   String apiurl = "https://oreg7.000webhostapp.com/login.php"; //api url
  //   //dont use http://localhost , because emulator don't get that address
  //   //insted use your local IP address or use live URL
  //   //hit "ipconfig" in windows or "ip a" in linux to get you local IP
  //   print(email);

  //   var response = await http.post(Uri.parse(apiurl), body: {
  //     'email': emailctrl.text, //get the username text
  //     'pass': passctrl.text //get password text
  //   });

  //   if (response.statusCode == 200) {
  //     var jsondata = json.decode(response.body);
  //     if (jsondata["error"]) {
  //       setState(() {
  //         showprogress = false; //don't show progress indicator
  //         error = true;
  //         errormsg = jsondata["message"];
  //         showToast(msg: errormsg);
  //       });
  //     } else {
  //       if (jsondata["success"]) {
  //         setState(() {
  //           error = false;
  //           showprogress = false;
  //           showToast(msg: "Signed In.");
  //           signInOnTap();
  //         });
  //         //showToast(msg: "Signed In.");

  //         //save the data returned from server
  //         //and navigate to home page
  //         // String uid = jsondata["uid"];
  //         // String fullname = jsondata["fullname"];
  //         // String address = jsondata["address"];
  //         // print(fullname);
  //         //user shared preference to save data
  //       } else {
  //         showprogress = false; //don't show progress indicator
  //         error = true;
  //         errormsg = "Something went wrong.";
  //         showToast(msg: "enter all parameters");
  //       }
  //     }
  //   } else {
  //     setState(() {
  //       showprogress = false; //don't show progress indicator
  //       error = true;
  //       errormsg = "Error during connecting to server.";
  //       showToast(msg: "something went wrong. Try again.");
  //     });
  //   }
  // }
}
