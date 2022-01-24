import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../shared/views/advance_network_image.dart';
import '../../../../shared/views/image_picker.dart';
import '../../controllers/recipe_modify_base_controller.dart';
import '../utils/recipe_utils.dart';

class RecipeModifyDocument <T extends RecipeModifyBaseController>
    extends GetView<T> {
  const RecipeModifyDocument({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      ImagePickers(
        onPickFile: controller.addDocuments,
        hasAddIcon: false,
      ),
      Utils.largeVerticalSpace,
      _items(),
    ],
  );
  Widget _items() => Container(
    width: Get.width,
    height: 100,
    decoration: RecipeUtils.itemDecoration(),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: Utils.middlePadding,
        child: Obx(() => Wrap(
            spacing: Utils.smallSpace,
            runSpacing: Utils.largeSpace,
            direction: Axis.vertical,
            children: _buildItems())),
      ),
    ),
  );


  List<Widget> _buildItems() {
    final List<Widget> _optionsList = [];
    for (final element in controller.documentsList) {
      _optionsList.add(_optionBuilder(element));
    }
    return _optionsList;
  }

  Widget _optionBuilder(
      final String documentId) =>
      Stack(
        clipBehavior: Clip.none,
        children: [
          AdvanceNetworkImage(
            documentId: documentId,
            imageSize: Utils.largeUserImageSize,
          ),
          _deletePhotoIcon(documentId),
        ],
      );
  Widget _deletePhotoIcon( final String documentId) => Positioned(
    top: -5,
    left: -15,
    child: InkWell(
      onTap:()=> controller.removeDocuments(documentId),
      child: Card(
        color: Colors.white.withOpacity(0.8),
        elevation: Utils.middleSpace,
        clipBehavior: Clip.antiAlias,
        shape: const CircleBorder(),
        child: Padding(
          padding: Utils.smallPadding,
          child: Icon(
            Icons.close,
            size: Utils.largeSpace,
            color: Get.theme.colorScheme.primary,
          ),
        ),
      ),
    ),
  );
}
