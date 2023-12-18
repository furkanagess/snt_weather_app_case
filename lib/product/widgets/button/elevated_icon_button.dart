import 'package:flutter/material.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';

@immutable
final class ElevatedIconButton extends StatelessWidget {
  const ElevatedIconButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.icon});
  final VoidCallback onPressed;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(context.theme.colorScheme.primary)),
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: context.textTheme.titleSmall!.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}
