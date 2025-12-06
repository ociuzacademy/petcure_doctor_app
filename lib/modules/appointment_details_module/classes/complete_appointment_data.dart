class CompleteAppointmentData {
  final int bookingId;
  final double weight;
  final String diagnosisAndVerdict;
  final String? notes;

  CompleteAppointmentData({
    required this.bookingId,
    required this.weight,
    required this.diagnosisAndVerdict,
    this.notes,
  });

  factory CompleteAppointmentData.fromJson(Map<String, dynamic> json) {
    return CompleteAppointmentData(
      bookingId: json['booking_id'],
      weight: json['weight'],
      diagnosisAndVerdict: json['diagnosis_and_verdict'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'weight': weight,
      'diagnosis_and_verdict': diagnosisAndVerdict,
      'notes': notes,
    };
  }
}
