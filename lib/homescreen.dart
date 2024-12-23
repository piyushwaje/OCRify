import 'dart:io';

import 'package:camera/camera.dart';
import 'package:doc_scanner/recongnizerscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late ImagePicker imagePicker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    _initializeCamera();
  }

  CameraController? _cameraController;
  List<CameraDescription>? _cameras;


  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras![0],
        ResolutionPreset.medium,
      );
      await _cameraController!.initialize();
      setState(() {});
    }
  }

  Future<void> _capturePhoto() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        final XFile photo = await _cameraController!.takePicture();
        File image = File(photo.path);

        // Navigate to the recognizer screen with the captured image
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return recongnizerscreen(image);
        }));
      } catch (e) {
        print("Error capturing photo: $e");
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("OCRify",style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 50 , bottom: 15,left: 5,right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Card(
              color: Colors.black,
              child: Container(
                height: MediaQuery.of(context).size.height - 300,
                child: _cameraController != null &&
                    _cameraController!.value.isInitialized
                    ? CameraPreview(_cameraController!)
                    : const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Card(
              color: Colors.blue,
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Icon(Icons.rotate_left,size: 35,color: Colors.white,),
                      onTap: (){},
                    ),
                    InkWell(
                      child: Icon(Icons.camera_alt,size: 50,color: Colors.white,),
                      onTap: () async {
                        _capturePhoto();
                      },
                    ),
                    InkWell(
                      child: Icon(Icons.image_outlined,size: 35,color: Colors.white,),
                      onTap: () async {
                       XFile? file =  await imagePicker.pickImage(source: ImageSource.gallery);
                       if( file!= null)
                         {
                           File image = File(file.path);
                           Navigator.push(context, MaterialPageRoute(builder: (ctx){
                                return recongnizerscreen(image);
                           }));
                         }

                      },
                    )
                  ],
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
