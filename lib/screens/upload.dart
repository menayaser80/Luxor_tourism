import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vixor_project/componenet/button.dart';
import 'package:vixor_project/componenet/circle_imagebutton.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/componenet/padge.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/bottom_nav_bar.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? _imageFile;

  // Function to open the device's camera
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  // Function to open the device's gallery
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padge(),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextWidget(
                  text: 'Account setting',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const CustomTextWidget(
                          text: 'Upload Your Image',
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      const SizedBox(
                        height: 15,
                      ),
                      _imageFile != null
                          ? Image.file(
                              _imageFile!,
                              width: 200,
                              height: 200,
                            )
                          : const CustomTextWidget(text: 'No image selected'),
                      const SizedBox(height: 20),
                      CircleImageButton(
                          imagePath: Assets.imagesUploadphoto,
                          onPressed: _pickImageFromGallery),
                      ElevatedButton(
                        onPressed: _pickImageFromCamera,
                        child: const CustomTextWidget(text: 'Use camera'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Button(
                    text: "Finish",
                    color: const Color(0xff217DB4),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomBottomNavBar()),
                      );
                    })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
