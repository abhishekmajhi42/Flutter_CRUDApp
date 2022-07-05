import 'package:flutter/material.dart';
import 'package:flutter_app/authenticate.dart';
import 'package:flutter_app/query_mutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VerifyMobile extends StatefulWidget {
  const VerifyMobile({Key? key}) : super(key: key);

  @override
  State<VerifyMobile> createState() => _VerifyMobileState();
}

class _VerifyMobileState extends State<VerifyMobile> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();

  String phone = "";
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Mobile"),
      ),
      body: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
                labelText: "Enter Phone", hintText: "Enter phone"),
            controller: phoneController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Enter OTP", hintText: "Enter OTP"),
            controller: otpController,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                verify(phone: phoneController.text, otp: otpController.text);
                /* runMutation({
                            
                            'phone': phoneController.text,
                            'otp': otpController.text,
                            
                          });*/
              },
              child: const Text("Verify")),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
              onPressed: () {
                authenticateScreen();
              },
              child: const Text("NEXT")),
        ],
      )),
    );
  }

  verify({String? phone, String? otp}) {
    QueryAndMutation utils = QueryAndMutation(phone: phone!, otp: otp!);
    utils.verifyUser(phone: phone, otp: otp);
    print("Inside verify mobile");
  }

  authenticateScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthenticateUser()),
    );
  }
}
