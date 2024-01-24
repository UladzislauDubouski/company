import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'company_info_model.dart';
import 'company_info_repository.dart';

class CompanyInfoController extends GetxController {
  final CompanyInfoRepository repository = CompanyInfoRepository();
  final Rx<CompanyInfo> companyInfo = CompanyInfo(
    companyName: '',
    ogrn: '',
    legalAddress: '',
  ).obs;

  final RxBool dataNotFound = false.obs;

  Future<void> getCompanyInfo(String inn) async {
    try {
      final data = await repository.getCompanyInfo(inn);
      companyInfo.value = data;
      dataNotFound.value = false;
    } catch (e) {
      dataNotFound.value = true;
      if (kDebugMode) {
        print('$e');
      }
    }
  }
}
