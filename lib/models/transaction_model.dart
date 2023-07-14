import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/models/transaction_type_model.dart';

class TransactionModel {
  final int? id;
  final int? userId;
  final int? transactionTypeId;
  final int? amount;
  final String? transactionCode;
  final String? description;
  final DateTime? createdAt;
  final String? status;
  final PaymentMethodModel? paymentMethod;
  final TransactionTypeModel? transactionType;

  TransactionModel({
    this.id,
    this.userId,
    this.transactionTypeId,
    this.amount,
    this.transactionCode,
    this.description,
    this.createdAt,
    this.status,
    this.paymentMethod,
    this.transactionType,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        userId: json['user_id'],
        transactionTypeId: json['transaction_type_id'],
        amount: json['amount'],
        transactionCode: json['transaction_code'],
        description: json['description'],
        createdAt: DateTime.tryParse(json['created_at']),
        status: json['status'],
        paymentMethod: json['payment_method'] == null
            ? null
            : PaymentMethodModel.fromJson(json['payment_method']),
        transactionType: json['transaction_type'] == null
            ? null
            : TransactionTypeModel.fromJson(json['transaction_type']),
      );
}
