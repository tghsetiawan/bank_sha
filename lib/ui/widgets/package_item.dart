import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel dataPlanModel;
  final bool isSelected;

  const PackageItem({
    super.key,
    required this.dataPlanModel,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${dataPlanModel.name.toString()}GB',
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: medium),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(dataPlanModel.price ?? 0),
            style: greyTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}