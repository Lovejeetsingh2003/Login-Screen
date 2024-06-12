import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_app/home_page.dart';

class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {
  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focuspsw = FocusNode();
  var isHidePsw = true;
  void login() {
    if (textEmailController.text.toString().isEmpty) {
      focusEmail.requestFocus();
      Fluttertoast.showToast(
          msg: "Enter Your Emial", toastLength: Toast.LENGTH_LONG);
    } else if (textPasswordController.text.toString().isEmpty) {
      focuspsw.requestFocus();
      Fluttertoast.showToast(
          msg: "Enter Your Password", toastLength: Toast.LENGTH_LONG);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("This is Snackbar"),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Login Successfull", toastLength: Toast.LENGTH_LONG);
            },
          ),
        ),
      );
      textEmailController.clear();
      textPasswordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover the best\nProduct!",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(47, 75, 78, 1),
            // fontFamily: GoogleFonts.roboto
          ),
          // style: GoogleFonts.roboto(
          //   fontSize: 30,
          //   fontWeight: FontWeight.w500,
          // ),
        ),
        actions: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/image.jpeg"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: TextField(
                controller: textEmailController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter Your Email",
                  hintStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: TextField(
                obscureText: isHidePsw ? true : false,
                controller: textPasswordController,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  hintStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isHidePsw = !isHidePsw;
                      setState(() {});
                    },
                    child: isHidePsw
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: ElevatedButton(
                onPressed: login,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
