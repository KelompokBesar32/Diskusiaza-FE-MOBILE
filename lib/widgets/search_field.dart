import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.hint,
    this.icon,
  }) : super(key: key);

  final String hint;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: (icon == null)
          ? TextFormField(
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: hint,
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.all(8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: infoColor,
                    width: 1,
                  ),
                ),
              ),
            )
          : TextFormField(
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: hint,
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(icon),
                contentPadding: const EdgeInsets.all(8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: infoColor,
                    width: 1,
                  ),
                ),
              ),
            ),
    );
  }
}
