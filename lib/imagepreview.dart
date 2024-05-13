import 'dart:io';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white, // 背景颜色
        border: Border.all(
          color: Colors.black, // 邊框颜色
          width: 2, // 宽度
        ),
        // borderRadius: BorderRadius.circular(10), //圓角
      ),
      child: imagePath == null
          ? const Center(
            child: Text(
              "No image selected",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          : Image.file(
              File(imagePath!),   //'!' 用於表示imagePath變量一定不為空
              fit: BoxFit.contain,
            ),
    );
  }
}