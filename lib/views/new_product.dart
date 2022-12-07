import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:pos/widgets/cutome_text.dart';

class NewProduct extends ConsumerStatefulWidget {
  const NewProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewProductState();
}

class _NewProductState extends ConsumerState<NewProduct> {
  final _formKey = GlobalKey<FormState>();
  FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  String productCode = "";
  String imageUlr = "";

  Future<void> pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(source: ImageSource.gallery);
      final String fileName = path.basename(pickedImage!.name);
      File file = File(pickedImage.path);
      var snapshot = storage.ref().child("images/$fileName");
      final downloadUrl = await snapshot.getDownloadURL();
      setState(() {
        imageUlr = downloadUrl;
      });
    } catch (e) {}
  }

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
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue.shade600)),
                    onPressed: () async {
                      productCode = await FlutterBarcodeScanner.scanBarcode(
                          "#ff6666", "cancel", true, ScanMode.BARCODE);
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                    ),
                    label: CustomeText(
                      text: "Product Code",
                      textStyle: theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.white),
                    )),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue.shade500),
                        elevation: MaterialStateProperty.all(0.0)),
                    onPressed: () async {
                      await pickImage();
                    },
                    icon: const Icon(Icons.camera),
                    label: CustomeText(
                      text: "Upload image",
                      textStyle: theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.white),
                    )),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange.shade600),
                          elevation: MaterialStateProperty.all(0.0)),
                      onPressed: () async {},
                      icon: const Icon(Icons.check),
                      label: CustomeText(
                        text: "Save",
                        textStyle: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.white),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
