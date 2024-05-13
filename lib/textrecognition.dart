import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'imagepreview.dart';

class TextRecognition extends StatefulWidget {
  const TextRecognition({
    Key? key,
    required this.imagePath}) : super(key: key);

  final String imagePath ;


  @override
  State<TextRecognition> createState() => _TextRecognitionState();
}

class _TextRecognitionState extends State<TextRecognition> {
  bool isRecognizing = false;
  String _extractedText = "";
  Future<String> extractedText(imagePath) async {
    InputImage inputImage = InputImage.fromFilePath(imagePath);
    if (inputImage == null) {
      return "null";
    }
    final textRecognizer = TextRecognizer(
        script: TextRecognitionScript.chinese);
    final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage);

    _extractedText = recognizedText.text;
    print("recognizedText: ${recognizedText}");
    print("_extractedText: ${_extractedText}");
    return _extractedText;
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ML Text Recognition'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ImagePreview(imagePath: widget.imagePath),
            ),

                      // child: CircularProgressIndicator(
                      //   strokeWidth: 1.5,
            FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.camera_alt_rounded,
                color: Colors.black,
              ),
              onPressed: () async {
                await extractedText(widget.imagePath);
                setState(() {});
              }
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Center(
                child: SelectableText(
                  _extractedText.isEmpty
                      ? "No text recognized"
                      : _extractedText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}




// try {
//
// }catch (e) {
//   return 'Hello, world!';
// }
// }
// Future <String> extractedText() async {
//   try {
//     InputImage inputImage = InputImage.fromFilePath(imagePath);
//     final textRecognizer = TextRecognizer(
//         script: TextRecognitionScript.chinese);
//     final RecognizedText recognizedText = await textRecognizer.processImage(
//         inputImage);
//
//     setState(() {
//       // String text = recognizedText.text;
//       for (TextBlock block in recognizedText.blocks) {
//         //each block of text/section of text
//         final String text = block.text;
//         print("block of text: ");
//         print(text);
//         for (TextLine line in block.lines) {
//           //each line within a text block
//           for (TextElement element in line.elements) {
//             //each word within a line
//             _extractedText += element.text + " ";
//           }
//           _extractedText += "\n\n";
//         }
//       }
//       // _extractedText += "\n\n";
//     });
//     textRecognizer.close();
//     return Future.value(_extractedText);
//   }catch (e) {
//     return 'Hello, world!';
//   }
// }