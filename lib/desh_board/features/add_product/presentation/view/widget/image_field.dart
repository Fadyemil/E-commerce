import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  final ImagePicker _picker = ImagePicker();

  bool isLoading = false;
  File? fileImage;
  Uint8List? webImage; // To handle web images

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: InkWell(
        onTap: () async {
          setState(() => isLoading = true);
          try {
            final XFile? pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              if (kIsWeb) {
                final bytes = await pickedFile.readAsBytes();
                setState(() {
                  webImage = bytes;
                });
                widget.onFileChanged(File(pickedFile.path));
              } else {
                setState(() {
                  fileImage = File(pickedFile.path);
                  widget.onFileChanged(File(pickedFile.path));
                });
              }
            }
          } catch (e) {
            log('Error picking image: $e');
          } finally {
            setState(() => isLoading = false);
          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 16.h),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey),
              ),
              child: _buildImageWidget(),
            ),
            Visibility(
              visible: fileImage != null || webImage != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    fileImage = null;
                    webImage = null;
                    widget.onFileChanged(null);
                  });
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget() {
    if (kIsWeb && webImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.memory(
          webImage!,
          fit: BoxFit.cover,
        ),
      );
    } else if (!kIsWeb && fileImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.file(
          fileImage!,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Icon(
        Icons.image_outlined,
        size: 180.r,
      );
    }
  }
}
