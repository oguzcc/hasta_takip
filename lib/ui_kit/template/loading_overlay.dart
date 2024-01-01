import 'package:flutter/material.dart';

import '../widget/indicator/loading_indicator.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoadingIndicator.center(),
    );
  }
}
