import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:image_picker/image_picker.dart';

import '../../../infrastructures/utils/utils.dart';
import '../repositories/upload_document_repository.dart';

class UploadDocumentController extends GetxController {
  RxBool importLoading = false.obs;

  String? documentId;


final UploadDocumentRepository _documentRepository=UploadDocumentRepository();

  Future<void> uploadDocument({required final XFile fileDetails}) async {
    importLoading.value = true;
    final FormData formData =  await Utils.convertToByte(fileDetails);
    final Either<String, String> response =
        await _documentRepository.uploadDocument(
      formData: formData,
    );
    response.fold(
      (final exception) {
        importLoading.value = false;
        Get.back();
      },
      (final data) {
        importLoading.value = false;
        documentId = data;
      },
    );
  }

}
