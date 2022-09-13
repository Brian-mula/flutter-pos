import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/widgets/cutome_text.dart';

class VerifyPage extends ConsumerStatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyPageState();
}

class _VerifyPageState extends ConsumerState<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: Column(
          children: [
            const Center(
                child: CustomeText(
              text: "Verification",
              size: 20,
              color: Colors.black87,
            )),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Icon(
                Icons.mail,
                color: Colors.blue.shade500,
                size: 70,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: const CustomeText(text: 'We send an Email to:')),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const CustomeText(text: "+254717105986"))
          ],
        ),
      ),
    );
  }
}
