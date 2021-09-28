import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/api/firebaseApi.dart';
import 'package:instagram_clone/provider/save_info_regist.dart';
import 'package:instagram_clone/widgets/registerViewWidgets/addImageAvatar.dart';
import 'package:instagram_clone/widgets/registerViewWidgets/numberPickerSecondPageWidget.dart';
import 'package:instagram_clone/widgets/registerViewWidgets/testFiledSecondPageWidget.dart';
import 'package:provider/provider.dart';

class BuildSecondPage extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<SaveInfoRegist>(
        create: (_) => SaveInfoRegist(),
        builder: (context, child) {
          return Column(
            children: [
              Flexible(
                flex: 3,
                child: Container(),
              ),
              AddImageAvatare(),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Text(
                "How old are you?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NumberPickerSecondPage(),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Years",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Text(
                "Chose a username",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                child: TextFieldSecondPage(),
              ),
              TextButton(
                onPressed: () async {
                  String name = context.read<SaveInfoRegist>().getName();

                  File? _imageFile = context.read<SaveInfoRegist>().getImage();
                  if (_imageFile == null) return;

                  final fileName = "$name.jpg";
                  final destination = 'avatars/$fileName';

                  UploadTask? task =
                      FirebaseApi.uploadFile(destination, _imageFile);
                  if (task == null) return;

                  final snapshot = await task.whenComplete(() {});
                  final urlDownload = await snapshot.ref.getDownloadURL();
                  
                  users.add({
                    'name': name,
                    "age": context.read<SaveInfoRegist>().getAge(),
                    "url": urlDownload
                  });
                  Navigator.pushReplacementNamed(context, "/main");
                },
                child: Text("Save"),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          );
        },
      ),
    );
  }
}
