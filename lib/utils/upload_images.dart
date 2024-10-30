
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageUtils {
  static void customImagePicker(
      {required BuildContext context,
      required Function(XFile pickedFile) callback,
      required ImagePicker picker}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Camera'),
                  onTap: () {
                    getImage(
                      fromGalery: false,
                      callback: callback,
                      picker: picker,
                    );
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_album),
                  title: const Text('Gallery'),
                  onTap: () {
                    getImage(
                      fromGalery: true,
                      callback: callback,
                      picker: picker,
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  static void getImage(
      {required bool fromGalery,
      required Function(XFile pickedFile) callback,
      required ImagePicker picker}) async {
    final pickedFile = await picker.pickImage(
        source: fromGalery ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 80);
    if (pickedFile != null) {
      callback(pickedFile);
    } else {}
  }
}
