class UsageData {
  final String dateOfBillIssued;
  final int electricityConsumerNumber;
  final double electricityAmountPaid;
  final double electricityKilowattUsed;
  final int waterConsumerNumber;
  final double waterAmountPaid;
  final double waterLitersUsed;

  UsageData({
    required this.dateOfBillIssued,
    required this.electricityConsumerNumber,
    required this.electricityAmountPaid,
    required this.electricityKilowattUsed,
    required this.waterConsumerNumber,
    required this.waterAmountPaid,
    required this.waterLitersUsed,
  });

  factory UsageData.fromJson(Map<String, dynamic> json) {
    return UsageData(
      dateOfBillIssued: json['dateOfBillIssued'],
      electricityConsumerNumber: json['electricityConsumerNumber'],
      electricityAmountPaid: json['electricityAmountPaid'].toDouble(),
      electricityKilowattUsed: json['electricityKilowattUsed'].toDouble(),
      waterConsumerNumber: json['waterConsumerNumber'],
      waterAmountPaid: json['waterAmountPaid'].toDouble(),
      waterLitersUsed: json['waterLitersUsed'].toDouble(),
    );
  }
}
