class PatientDetails {
  final int id;
  final int male;
  final int female;
  final int patient;
  final int treatment;
  final String treatmentName;

  PatientDetails({
    required this.id,
    required this.male,
    required this.female,
    required this.patient,
    required this.treatment,
    required this.treatmentName,
  });

  factory PatientDetails.fromJson(Map<String, dynamic> json) {
    return PatientDetails(
      id: json['id'],
      male: json['male'],
      female: json['female'],
      patient: json['patient'],
      treatment: json['treatment'],
      treatmentName: json['treatment_name'],
    );
  }
}
