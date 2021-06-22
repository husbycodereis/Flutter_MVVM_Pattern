import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const NormalButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
    );
  }
}
