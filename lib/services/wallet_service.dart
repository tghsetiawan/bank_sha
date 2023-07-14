import 'dart:convert';

import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class WalletService {
  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      print('$baseUrl/wallets');
      print('oldPIN : $oldPin newPIN : $newPin');
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse('$baseUrl/wallets'),
        body: {
          'previous_pin': oldPin,
          'new_pin': newPin,
        },
        headers: {
          'Authorization': token,
        },
      );

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      rethrow;
    }
  }
}
