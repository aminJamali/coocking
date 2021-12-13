import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/pick_image_enum.dart';

class ImagePickers extends StatefulWidget {
  const ImagePickers({final Key? key}) : super(key: key);

  @override
  _ImagePickersState createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
  Uint8List? _byte;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(final BuildContext context) => _imageForm();

  Widget _imageForm() => Center(
        child: InkWell(
          onTap: _showImageDialog,
          child: Stack(
            clipBehavior: Clip.none,
            children: [_photoBox(), _addPhotoIcon()],
          ),
        ),
      );

  void _showImageDialog() {
    Get.dialog(
      AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('انتخاب عکس',style: TextStyle(color: Colors.grey),),
            _cancelImageButton(),
          ],
        ),
        content: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (Platform.isAndroid || Platform.isIOS) _cameraButton(),
              _galleryButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cameraButton() => TextButton.icon(
    icon: const Icon(Icons.camera_outlined,size: 30,),
      label:  const Text('دوربین',style: TextStyle(fontSize: 20),),
      onPressed: () => _pickImage(PickImage.camera),
  );
  Widget _cancelImageButton() => IconButton(
    onPressed: Get.back,
    icon: const Icon(Icons.close_outlined),
  );

  Widget _galleryButton() =>  TextButton.icon(
    icon: const Icon(Icons.collections_outlined,size: 30,),
    label:  const Text('گالری',style: TextStyle(fontSize: 20),),
    onPressed: () => _pickImage(PickImage.gallery),
  );
  Widget _photoBox() => Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.background,
          border: Border.all(
            width: 1,
            color: Get.theme.colorScheme.primary,
          ),
        ),
        child: _byte != null
            ? Image.memory(
                _byte!,
              )
            : const Center(
                child: Icon(
                Icons.image_outlined,
                color: Colors.black26,
              )),
      );



  Widget _addPhotoIcon() => Positioned(
        bottom: -2,
        right: -10,
        child: Icon(
          Icons.add_a_photo,
          size: 25,
          color: Get.theme.colorScheme.primary,
        ),
      );

  Future<void> _pickImage(final PickImage _imageType) async {
    Get.back();
    XFile? pickedFile;
    if (_imageType == PickImage.camera) {
      pickedFile = await _imgFromCamera();
    } else {
      pickedFile = await _imgFromGallery();
    }

    setState(() {
      if (pickedFile != null) {
        pickedFile.readAsBytes().then((final value) => _byte = value);
      }
    });
  }

  Future<XFile?> _imgFromGallery() async =>
      _picker.pickImage(source: ImageSource.gallery, imageQuality: 20);

  Future<XFile?> _imgFromCamera() async =>
      _picker.pickImage(source: ImageSource.camera, imageQuality: 20);
}
