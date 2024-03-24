import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickedImage});
  final void Function(File image) onPickedImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera); // this return future type xFile;
    if (pickedImage == null) {
      return;
    }
    //after take/capture image put to to varibale
    setState(() {
      _selectedImage = File(pickedImage
          .path); 
    });
   widget.onPickedImage(_selectedImage!); // method take image
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera),
      label: const Text('Take picture'),
    );
    if (_selectedImage != null) {
    
      // TextButton replace by capture image
      content = GestureDetector(
      
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          //max limit is container height and width
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 250,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: content,
    );
  }
}
