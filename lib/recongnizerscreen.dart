import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:share_plus/share_plus.dart';

class recongnizerscreen extends StatefulWidget {
  final File iamge;
  const recongnizerscreen(this.iamge, {Key? key}) : super(key: key);

  @override
  State<recongnizerscreen> createState() => _recongnizerscreenState();
}

class _recongnizerscreenState extends State<recongnizerscreen> {
  late TextRecognizer textRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    dotext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text(
            "OCRify",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.file(widget.iamge),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: result));
                        // Provide feedback to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Text copied to clipboard!")),
                        );
                      },
                      icon: Icon(Icons.copy)),
                  IconButton(
                    onPressed: () {
                      if (result.isNotEmpty) {
                        Share.share(result);
                      } else {
                        // Provide feedback if result is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Nothing to share!")),
                        );
                      }
                    },
                    icon: Icon(Icons.share),
                  ),
                ],
              ),
              Container(
                child: Text(result),
              )
            ],
          ),
        ));
  }

  String result = "T";
  Future<void> dotext() async {
    InputImage inputImage = InputImage.fromFile(this.widget.iamge);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    setState(() {
      result = text;
    });

    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
  }
}
