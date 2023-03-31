import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final List<XFile> imageFile = [];

  Future pickImage() async {
    final imagePicker = ImagePicker();

    final List<XFile> images = await imagePicker.pickMultiImage();

    setState(() {
      imageFile.addAll(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imageFile.isNotEmpty
          ? ListView.builder(
              clipBehavior: Clip.antiAlias,
              physics: const BouncingScrollPhysics(),
              itemCount: imageFile.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.file(File(imageFile[index].path));
              },
            )
          : const Center(
              child: Text('No Images Selected'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await pickImage();
        },
        tooltip: 'Pick Images',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
