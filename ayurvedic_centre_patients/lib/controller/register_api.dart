import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> postDataToServer({
  required String? selectedTreatment,
  required String? selectedTreatment2,
  required String? selectedTreatment3,
  required int maleCount,
  required int femaleCount,
  required String? totalAmount,
  required String? discountAmount,
  required String? paymentOption,
  required String? advanceAmount,
  required String? balanceAmount,
  required String? treatmentDate,
  required String? treatmentTime,
}) async {
  const String url = 'https://flutter-amr.noviindus.in/api/PatientUpdate';

  Map<String, dynamic> data = {
    'selectedTreatment': selectedTreatment,
    'selectedTreatment2': selectedTreatment2,
    'selectedTreatment3': selectedTreatment3,
    'maleCount': maleCount,
    'femaleCount': femaleCount,
    'totalAmount': totalAmount,
    'discountAmount': discountAmount,
    'paymentOption': paymentOption,
    'advanceAmount': advanceAmount,
    'balanceAmount': balanceAmount,
    'treatmentDate': treatmentDate,
    'treatmentTime': treatmentTime,
    // Add more fields as needed
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Data posted successfully
      print('Data posted successfully');
    } else {
      // Error occurred
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    // Exception occurred
    print('Exception occurred while posting data: $e');
  }
}
