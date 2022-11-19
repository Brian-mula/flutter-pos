import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pos/widgets/cutome_text.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  final TextEditingController phoneController = TextEditingController();
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
      body: Container(
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
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade500)),
                  onPressed: () {},
                  child: CustomeText(
                    text: "Continue",
                    textStyle: theme.textTheme.headline6!
                        .copyWith(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
