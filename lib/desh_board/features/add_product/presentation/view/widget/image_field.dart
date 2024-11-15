import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  final ImagePicker _picker = ImagePicker();
  // ignore: unused_field
  Uint8List? _fileBytes;
  Image? _imageWidget;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: InkWell(
        onTap: () async {
          isLoading = true;
          setState(() {
            
          });
          final XFile? pickedFile =
              await _picker.pickImage(source: ImageSource.gallery);
      
          if (pickedFile != null) {
            final bytes = await pickedFile.readAsBytes();
      
            setState(() {
              _fileBytes = bytes;
              _imageWidget = Image.memory(bytes);
            });
          }
          isLoading = false;
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 16.h),
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.grey),
          ),
          child: _imageWidget ??
              Icon(
                Icons.image_outlined,
                size: 180.r,
              ),
        ),
      ),
    );
  }
}
