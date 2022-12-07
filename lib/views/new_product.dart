import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/widgets/cutome_text.dart';

class NewProduct extends ConsumerStatefulWidget {
  const NewProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewProductState();
}

class _NewProductState extends ConsumerState<NewProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        centerTitle: true,
        elevation: 0.0,
        title: CustomeText(
          text: "Add Product",
          textStyle: theme.textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the name";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.blue.shade400)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.blue.shade600))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: priceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the Price";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Price",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.blue.shade400)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.blue.shade600))),
                ),
              ],
            )),
      ),
    );
  }
}
