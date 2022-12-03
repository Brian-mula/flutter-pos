import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/widgets/cutome_text.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 35,
            )),
        centerTitle: true,
        elevation: 0.0,
        title: CustomeText(
          text: "Products",
          textStyle: theme.textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
