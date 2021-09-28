import 'dart:io';

import 'package:flutter/material.dart';

class SaveInfoRegist extends ChangeNotifier {
  int _age = 18;
  String _name = "";
  File? _imageFile;

  int getAge() {
    return _age;
  }

  void setAge(int age) {
    _age = age;
  }

  String getName() {
    return _name;
  }

  void setName(String name) {
    _name = name;
  }

  File? getImage() {
    return _imageFile;
  }

  void setImage(File imageFile) {
    _imageFile = imageFile;
  }
}
