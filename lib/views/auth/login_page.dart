import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/widgets/cutome_text.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomeText(
          text: "Flutter POS",
          size: 18,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Stack(
          children: [
            Positioned(
                left: 50,
                right: 50,
                top: 30,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2018/01/13/10/29/business-3079910__340.jpg'),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                top: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ))
          ],
        ),
      ),
    );
  }
}
