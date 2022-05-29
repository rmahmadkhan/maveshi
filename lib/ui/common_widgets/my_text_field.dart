import 'package:maveshi/all_utils.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? caption;
  final TextInputType keyboardType;
  final bool obscure;
  final bool enabled;
  final bool readOnly;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final int maxLines;

  const MyTextField({
    required this.controller,
    this.hintText,
    this.caption,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.enabled = true,
    this.readOnly = false,
    this.prefixWidget,
    this.suffixWidget,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = TextFormField(
      obscureText: obscure,
      controller: controller,
      maxLines: maxLines,
      enabled: enabled,
      readOnly: readOnly,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter a Valid Text';
        }
        return null;
      },
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 16,
        color: AppTheme.navyBlueColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixWidget == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: prefixWidget,
              ),
        suffixIcon: suffixWidget == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: suffixWidget,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppTheme.orangeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppTheme.navyBlueColor),
        ),
        hintText: hintText,
        fillColor: AppTheme.navyBlueColor,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: AppTheme.lightNavyBlueColor,
          fontWeight: FontWeight.normal,
        ),
        isDense: true,
      ),
    );

    if (caption != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            caption!,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.navyBlueColor,
          ),
          const VerticalSpacing(of: 10),
          textField,
        ],
      );
    } else {
      return textField;
    }
  }
}
