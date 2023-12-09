// lib/services/api/azure_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

class AzureService {
  final String azureFunctionUrl = 'https://<your-azure-function-url>';

  Future<void> createExercise(Map<String, dynamic> exerciseData) async {
    var url = Uri.parse('$azureFunctionUrl/createExercise');
    var response = await http.post(url, body: json.encode(exerciseData));
    if (response.statusCode != 200) {
      throw Exception('Failed to create exercise');
    }
    // Handle the response...
  }

  // Other Azure Functions related methods...
}
