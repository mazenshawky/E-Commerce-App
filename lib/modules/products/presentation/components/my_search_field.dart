import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';

class MySearchField extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const MySearchField({
    super.key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  });

  @override
  State<MySearchField> createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: AppColors.primary);
    const styleHint = TextStyle(color: AppColors.blackColor54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: AppSize.s45,
      margin: const EdgeInsets.fromLTRB(
          AppSize.s16, AppSize.s0, AppSize.s16, AppSize.s16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        color: AppColors.whiteColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    searchController.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
