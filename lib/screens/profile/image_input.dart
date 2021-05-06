import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageInput(showPicker, type, imageFile, defaultImageUrl) {
  return Container(
    height: 150,
    width: 300,
    child: InkWell(
      onTap: () {
        showPicker(type);
      },
      child: imageFile != null
          ? Image.file(
              imageFile,
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            )
          : Image.network(defaultImageUrl),
    ),
  );
}
