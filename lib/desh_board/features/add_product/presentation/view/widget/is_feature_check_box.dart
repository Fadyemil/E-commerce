import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsFeatureCheckBox extends StatefulWidget {
  const IsFeatureCheckBox({
    super.key,
    required this.isTermsAccepted,
    required this.onChecked,
  });
  final bool isTermsAccepted;
  final ValueChanged<bool> onChecked;

  @override
  State<IsFeatureCheckBox> createState() => _IsFeatureCheckBoxState();
}

class _IsFeatureCheckBoxState extends State<IsFeatureCheckBox> {
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
        Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
              widget.onChecked(_isChecked);
            });
          },
          child: SizedBox(
            child: Text(
              'Is feature item',
              style: AppTextStyles.bodyBasaBold16.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        CustomCheckBox(
          isChecked: _isChecked,
          onChecked: (value) {
            setState(() {
              _isChecked = value;
              widget.onChecked(_isChecked);
            });
          },
        ),
      ],
    );
  }
}
