import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thesaurus/components/sized_fade_switcher.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final void Function(String value) onChanded;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;

  const TextInputField({
    Key? key,
    required this.hintText,
    required this.onChanded,
    this.suffixIcon,
    this.errorText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: obscureText,
          onChanged: onChanded,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            filled: true,
            fillColor: Colors.transparent,
            hintStyle: GoogleFonts.marcellus(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 1.5, color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2, color: Colors.green),
            ),
          ),
        ),
        SizedFadeSwitcher(
            child: errorText != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      errorText!,
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  )
                : const SizedBox.shrink())
      ],
    );
  }
}
