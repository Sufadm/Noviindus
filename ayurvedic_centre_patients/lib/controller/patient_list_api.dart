import 'dart:convert';

import 'package:ayurvedic_centre_patients/model/patient_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<Patient>> fetchData() async {
  final url = Uri.parse('https://flutter-amr.noviindus.in/api/PatientList');
  final shared = await SharedPreferences.getInstance();
  String? accessToken = shared.getString('access');

  final response = await http.get(url, headers: {
    'Authorization': 'Bearer $accessToken',
  });

  if (response.statusCode == 200) {
    dynamic jsonResponse = jsonDecode(response.body);
    if (jsonResponse is Map<String, dynamic>) {
      if (jsonResponse.containsKey('patient')) {
        List<dynamic> patientDataList = jsonResponse['patient'];
        List<Patient> patients = patientDataList
            .map((patientData) => Patient.fromJson(patientData))
            .toList();
        return patients;
      }
    }
    throw Exception('Invalid response format');
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<PatientDetails>> fetchDatasPatientdetails() async {
  final url = Uri.parse('https://flutter-amr.noviindus.in/api/PatientList');
  final shared = await SharedPreferences.getInstance();
  String? accessToken = shared.getString('access');

  final response = await http.get(url, headers: {
    'Authorization': 'Bearer $accessToken',
  });

  if (response.statusCode == 200) {
    dynamic jsonResponse = jsonDecode(response.body);
    if (jsonResponse is Map<String, dynamic>) {
      if (jsonResponse.containsKey('patient')) {
        List<dynamic> patientDataList = jsonResponse['patient'];
        List<PatientDetails> patients = patientDataList
            .map((patientData) => PatientDetails.fromJson(patientData))
            .toList();
        return patients;
      }
    }
    throw Exception('Invalid response format');
  } else {
    throw Exception('Failed to load data');
  }
}
