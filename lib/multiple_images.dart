import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImageScreen extends StatefulWidget {
  const MultipleImageScreen({Key? key}) : super(key: key);

  @override
  _MultipleImageScreenState createState() => _MultipleImageScreenState();
}

class _MultipleImageScreenState extends State<MultipleImageScreen> {
  File? MyImage;
  final ImagePicker _picker = ImagePicker();
  List<dynamic> listImage = [];

  Future getImageFromCamera() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    MyImage = File(image!.path);
    listImage.add(MyImage);
    setState(() {
      listImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multile Image"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          child: listImage.isEmpty ?
          const Text("Image is not Selected") :
         GridView.count(
             crossAxisCount: 3,
             crossAxisSpacing: 8.0,
             mainAxisSpacing: 8.0,
             children: List.generate(listImage.length, (index) {
            var image = listImage[index];
            return Padding(padding: const EdgeInsets.all(10),
                child: Container(
              decoration: BoxDecoration(border: Border.all(width: 2)),
                child: Image.file(image)
                ),
            );
         })),
       ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt_outlined),
        onPressed: () {
          getImageFromCamera();
        },
      ),
    );
  }
}
