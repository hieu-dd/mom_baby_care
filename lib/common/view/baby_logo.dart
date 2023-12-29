import 'package:flutter/material.dart';

import '../../consts/images/assets_images.dart';
import 'border.dart';

class BabyLogo extends StatelessWidget {
  const BabyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '❤ Baby ❤',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: AppBorderRadius.medium,
                child: Image.asset(AssetsImage.babyAvatar),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
