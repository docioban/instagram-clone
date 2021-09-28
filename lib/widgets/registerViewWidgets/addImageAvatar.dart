import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/provider/save_info_regist.dart';
import 'package:provider/src/provider.dart';

class AddImageAvatare extends StatefulWidget {
  const AddImageAvatare({Key? key}) : super(key: key);

  @override
  _AddImageAvatareState createState() => _AddImageAvatareState();
}

class _AddImageAvatareState extends State<AddImageAvatare> {
  String? _image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print("was press");
                  selectFile();
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(_image ?? "images/avatar.jpg"),
                      radius: 70,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.3),
                      radius: 70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          _image == null ? 'upload foto' : '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void selectFile() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    if (image != null) {
      setState(() {
        context.read<SaveInfoRegist>().setImage(File(image.path));
        _image = image.path;
      });
    }
  }
}
