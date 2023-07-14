import 'dart:convert';

import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      print('$baseUrl/top_ups');
      print(data.toJson().toString());
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/top_ups',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferFormModel data) async {
    try {
      print('$baseUrl/transfers');
      print(data.toJson().toString());
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/transfers',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> dataPlan(DataPlanFormModel data) async {
    try {
      print('$baseUrl/data_plans');
      print(data.toJson().toString());
      final token = await AuthService().getToken();

      final res = await http.post(
          Uri.parse(
            '$baseUrl/data_plans',
          ),
          headers: {
            'Authorization': token,
          },
          body: data.toJson());

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransaction() async {
    try {
      print('$baseUrl/transactions');
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/transactions',
        ),
        headers: {
          'Authorization': token,
        },
      );

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode == 200) {
        return List<TransactionModel>.from(
          jsonDecode(res.body)['data'].map(
            (transaction) => TransactionModel.fromJson(transaction),
          ),
        ).toList();
      }
      throw json.decode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
