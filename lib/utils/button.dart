
import 'package:flutter/material.dart';
import 'package:tujikinge_wenyewe_responsable/controllers/bloc/state.dart';
import 'package:tujikinge_wenyewe_responsable/services/style.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final AppState? state;
  final Function() onTap;
  final Color? titleColor;
  final Color backGroundColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.backGroundColor,
    this.titleColor,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: state is LOADING
            ? SizedBox(
                height: 17,
                width: 17,
                child: CircularProgressIndicator(
                  color: AppStyle.WHITE,
                ),
              )
            : Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
