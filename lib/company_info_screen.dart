import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'company_info_controller.dart';

class CompanyInfoScreen extends StatelessWidget {
  final CompanyInfoController controller = Get.put(CompanyInfoController());
  final TextEditingController _innController = TextEditingController();

  CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация о компании'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _innController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Введите ИНН компании (10 цифр)',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(10),
              ],
              onChanged: (inn) => controller.getCompanyInfo(inn),
            ),
            const SizedBox(height: 32.0),
            Obx(
              () => controller.dataNotFound.value
                  ? const Text('Данные не найдены')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Наименование компании: ${controller.companyInfo.value.companyName}'),
                        Text('ОГРН: ${controller.companyInfo.value.ogrn}'),
                        Text(
                            'Юридический адрес: ${controller.companyInfo.value.legalAddress}'),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
