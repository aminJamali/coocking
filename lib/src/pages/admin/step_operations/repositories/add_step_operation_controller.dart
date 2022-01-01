import 'package:cooking/src/infrastructures/commons/advance_http_client.dart';
import 'package:cooking/src/infrastructures/utils/utils.dart';

class AddStepOperationRepository {
  AdvanceHttpClient? httpClient;
  AddStepOperationRepository() {
    httpClient = Utils.http();
  }
}
