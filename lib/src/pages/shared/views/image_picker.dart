import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../infrastructures/commons/parameters.dart';
import '../../../infrastructures/utils/utils.dart';
import '../controllers/upload_document_controller.dart';
import '../models/pick_image_enum.dart';
import 'advance_network_image.dart';

class ImagePickers extends StatefulWidget {
  final String? avatarId;
  final void Function(String)? onPickFile;

  const ImagePickers({
    final this.onPickFile,
    final this.avatarId,
    final Key? key,
  }) : super(key: key);

  @override
  _ImagePickersState createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
  final controller = Get.put(UploadDocumentController());
  final ImagePicker _picker = ImagePicker();
  String? _avatarId;

  @override
  void initState() {
    _avatarId = widget.avatarId;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => _imageForm();

  Widget _imageForm() => Center(
        child: InkWell(
          onTap: _showImageDialog,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AdvanceNetworkImage(
                imageSize: 100,
                documentId: _avatarId,
              ),
              _addPhotoIcon()
            ],
          ),
        ),
      );

  void _showImageDialog() {
    Get.dialog(
      AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'انتخاب عکس',
              style: TextStyle(color: Colors.grey),
            ),
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
        icon: const Icon(
          Icons.camera_outlined,
          size: 30,
        ),
        label: const Text(
          'دوربین',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () => _pickImage(PickImage.camera),
      );

  Widget _cancelImageButton() => IconButton(
        onPressed: Get.back,
        icon: const Icon(Icons.close_outlined),
      );

  Widget _galleryButton() => TextButton.icon(
        icon: const Icon(
          Icons.collections_outlined,
          size: 30,
        ),
        label: const Text(
          'گالری',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () => _pickImage(PickImage.gallery),
      );

  Widget _image() => Image.network(
        '${Parameters.fullUrl}/documents/$_avatarId',
        headers: {'authorization': 'Bearer ${Parameters.token}'},
        fit: BoxFit.fill,
      );

  Widget _addPhotoIcon() => Positioned(
        bottom: -2,
        right: -15,
        child: Card(
          color: Colors.white.withOpacity(0.8),
          elevation: Utils.middleSpace,
          clipBehavior: Clip.antiAlias,
          shape: const CircleBorder(),
          child: Padding(
            padding: Utils.smallPadding,
            child: Icon(
              Icons.add_a_photo,
              size: 25,
              color: Get.theme.colorScheme.primary,
            ),
          ),
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

    if (pickedFile != null) {
      await controller.uploadDocument(fileDetails: pickedFile).then((final _) {
        setState(() {
          _avatarId = controller.documentId;
        });
        widget.onPickFile?.call(controller.documentId!);
      });
    }
  }

  Future<XFile?> _imgFromGallery() async =>
      _picker.pickImage(source: ImageSource.gallery, imageQuality: 20);

  Future<XFile?> _imgFromCamera() async =>
      _picker.pickImage(source: ImageSource.camera, imageQuality: 20);
}
