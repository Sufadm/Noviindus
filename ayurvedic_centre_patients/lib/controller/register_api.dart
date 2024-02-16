import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

Future<void> postDataToServer({
  required String? selectedTreatment,
  required String? whatsapp,
  required String? address,
  required String? location,
  required String? branch,
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
  final shared = await SharedPreferences.getInstance();
  String? accessToken = shared.getString('access');
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
      body: {
        'selectedTreatment': selectedTreatment!,
        'whatsapp': whatsapp!,
        'address': address!,
        'location': location!,
        'branch': branch!,
        'selectedTreatment2': selectedTreatment2!,
        'selectedTreatment3': selectedTreatment3!,
        'maleCount': maleCount.toString(),
        'femaleCount': femaleCount.toString(),
        'totalAmount': totalAmount!,
        'discountAmount': discountAmount!,
        'paymentOption': paymentOption!,
        'advanceAmount': advanceAmount!,
        'balanceAmount': balanceAmount!,
        'treatmentDate': treatmentDate!,
        'treatmentTime': treatmentTime!,
      },
    );

    if (response.statusCode == 200) {
      print('Data posted successfully');
    } else {
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Exception occurred while posting data: $e');
  }
}
