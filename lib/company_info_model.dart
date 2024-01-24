class CompanyInfo {
  final String companyName;
  final String ogrn;
  final String legalAddress;

  CompanyInfo({
    required this.companyName,
    required this.ogrn,
    required this.legalAddress,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      companyName: json['name']['full'],
      ogrn: json['ogrn'],
      legalAddress: json['address']['unrestricted_value'],
    );
  }
}
