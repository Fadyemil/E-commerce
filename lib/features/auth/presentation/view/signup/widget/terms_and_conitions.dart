
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_colors.dart';
import 'custom_check_box.dart';

class TermsAndConitions extends StatefulWidget {
  const TermsAndConitions({
    super.key,
    required this.isTermsAccepted,
    required this.onChecked,
  });
  final bool isTermsAccepted;
  final ValueChanged<bool> onChecked;

  @override
  State<TermsAndConitions> createState() => _TermsAndConitionsState();
}

class _TermsAndConitionsState extends State<TermsAndConitions> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isTermsAccepted;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: _isChecked,
          onChecked: (value) {
            setState(() {
              _isChecked = value;
              widget.onChecked(_isChecked);
            });
          },
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
              widget.onChecked(_isChecked); // تحديث الحالة الخارجية
            });
          },
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width - (8 * 2) - 48,
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ' من خلال إنشاء حساب ، فإنك توافق على',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: AppColors.grayscale400,
                    ),
                  ),
                  TextSpan(
                    text: ' الشروط والأحكام الخاصة بنا ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: AppColors.green1_600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
