import 'package:flutter/widgets.dart';

class Gap extends StatelessWidget {
  const Gap({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size.height, width: size.width);
  }
}
