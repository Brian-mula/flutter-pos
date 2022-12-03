import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pinput/pinput.dart';
import 'package:pos/widgets/cutome_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  String verificationId = '';
  bool isPhone = true;
  bool isLoading = false;
  String? countryCode;

  Future<void> signInWithPhoneAuth(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: CustomeText(
          text: "Khetia Supermarket",
          textStyle:
              theme.textTheme.headline5!.copyWith(color: Colors.blue.shade600),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade700,
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            await auth.verifyPhoneNumber(
              phoneNumber: countryCode! + phoneController.text,
              verificationCompleted: (PhoneAuthCredential credential) {},
              verificationFailed: (FirebaseAuthException e) {},
              codeSent: (String verificationId, int? resendToken) {
                setState(() {
                  isPhone = false;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          }),
      body: isPhone
          ? Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/pos1.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IntlPhoneField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'KE',
                    onSaved: (PhoneNumber? phoneNumber) {
                      print("phone is: $phoneNumber");
                    },
                    onChanged: (phone) {
                      setState(() {
                        countryCode = phone.countryCode;
                      });
                      print(phone.completeNumber);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomeText(
                      text:
                          "We sent a verification code to ${phoneController.text}"),
                  const SizedBox(
                    height: 20,
                  ),
                  Pinput(
                    length: 6,
                    controller: pinController,
                    onSubmitted: (String pin) {
                      isLoading = true;
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId,
                              smsCode: pinController.text);
                      signInWithPhoneAuth(credential);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
    );
  }
}
