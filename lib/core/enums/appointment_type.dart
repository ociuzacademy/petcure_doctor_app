// To parse this JSON data, do
//
//     final todayBookingsModel = todayBookingsModelFromJson(jsonString);

enum AppointmentType {
  clinicalAppointment('clinical'),
  audioCall('audio_call');

  final String label;

  const AppointmentType(this.label);
  String toJson() => label;

  static AppointmentType fromString(String value) {
    return AppointmentType.values.firstWhere(
      (option) => option.label == value,
      orElse: () =>
          throw ArgumentError('Unknown AppointmentType value: $value'),
    );
  }
}
