import 'package:flutter/material.dart';

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
  Widget build(final BuildContext context) => documentId?.isNotEmpty ?? false
      ? _profileImage(documentId: documentId)
      : _defaultIcon(context);

  Widget _profileImage({final String? documentId}) => Padding(
    padding: Utils.tinyPadding,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(imageSize!),
      child: _image(documentId),
    ),
  );

  Widget _image(final String? documentId) => Image.network(
    '${Parameters.fullUrl}/documents/$documentId',
    headers: {'authorization': 'Bearer ${Parameters.token}'},
    fit: BoxFit.fill,
    width: imageSize,
    height: imageSize,
  );

  Widget _defaultIcon(final BuildContext context) => Padding(
    padding: Utils.tinyPadding,
    child: Container(
      width: imageSize,
      height: imageSize,
      decoration: _iconDecoration(),
      child:   Icon(
        Icons.restaurant_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  );

  BoxDecoration _iconDecoration() => BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.grey.shade300,
  );
}
