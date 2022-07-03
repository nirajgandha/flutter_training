import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInputFromCamera extends StatefulWidget {
  final Function onImageCaptured;

  ImageInputFromCamera(this.onImageCaptured);

  @override
  State<ImageInputFromCamera> createState() => _ImageInputFromCameraState();
}

class _ImageInputFromCameraState extends State<ImageInputFromCamera> {
  File _imageFromCamera;

  Future<void> _captureImage() async {
    final imageFileFromImagePicker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFileFromImagePicker == null) {
      return;
    }
    setState(() {
      _imageFromCamera = File(imageFileFromImagePicker.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFileFromImagePicker.path);
    final savedImage = await File(imageFileFromImagePicker.path)
        .copy('${appDir.path}/$fileName');
    widget.onImageCaptured(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imageFromCamera != null
              ? Image.file(
                  _imageFromCamera,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Captured',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Capture Image'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _captureImage,
          ),
        ),
      ],
    );
  }
}
