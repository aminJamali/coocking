import 'package:cooking/src/infrastructures/commons/http_client.dart';
import 'package:cooking/src/infrastructures/utils/utils.dart';

class AddStepOperationRepository {
  HttpClient? httpClient;
  AddStepOperationRepository() {
    httpClient = Utils.http(); 
  }
}
