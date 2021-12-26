import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/commons/parameters.dart';
import '../../../infrastructures/utils/utils.dart';

class AdvanceNetworkImage extends StatelessWidget {
  final String? documentId;
  final double? imageSize;

  const AdvanceNetworkImage({
    final this.imageSize = Utils.middleUserImageSize,
    final this.documentId,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => _photoBox();

  Widget _photoBox() => Container(
        width: imageSize,
        height: imageSize,
        decoration: _imageDecoration(),
        child: documentId != null ? _image() : _defaultIcon(),
      );

  Widget _image() => Image.network(
        '${Parameters.fullUrl}/documents/$documentId',
        headers: {'authorization': 'Bearer ${Parameters.token}'},
        fit: BoxFit.cover,
      );

  Widget _defaultIcon() => Center(
        child: Icon(
          Icons.restaurant_rounded,
          color: Get.theme.colorScheme.primary,
        ),
      );

  BoxDecoration _imageDecoration() => BoxDecoration(
        color: Get.theme.colorScheme.background,
        borderRadius: BorderRadius.circular(Utils.middleSpace),
        border: Border.all(
          width: 2,
          color: Get.theme.colorScheme.primary,
        ),
      );
}
