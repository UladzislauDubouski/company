import 'dart:convert';
import 'package:company/strings.dart';
import 'package:dio/dio.dart';

import 'company_info_model.dart';

class CompanyInfoRepository {
  final Dio dio = Dio();

  Future<CompanyInfo> getCompanyInfo(String inn) async {
    try {
      final response = await dio.post(
        AppStrings.apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Token ${AppStrings.apiKey}',
          },
        ),
        data: jsonEncode({
          'query': inn,
        }),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['suggestions'] != null && data['suggestions'].isNotEmpty) {
          return CompanyInfo.fromJson(data['suggestions'][0]['data']);
        } else {
          throw Exception('Данные не найдены');
        }
      } else {
        throw Exception('Ошибка при запросе данных: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
