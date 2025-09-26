class TreatmentDetailsHelper {
  static String calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;

    if (months < 0) {
      years--;
      months += 12;
    }

    if (years > 0) {
      return '$years year${years > 1 ? 's' : ''}';
    } else {
      return '$months month${months > 1 ? 's' : ''}';
    }
  }
}
