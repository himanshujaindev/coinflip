import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../theme/app_theme.dart';

class CoinWidget extends StatelessWidget {
  final bool isHeads;
  final Animation<double> rotationAnimation;
  final bool isFlipping;

  const CoinWidget({
    super.key,
    required this.isHeads,
    required this.rotationAnimation,
    required this.isFlipping,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: rotationAnimation,
      builder: (context, child) {
        final rotationValue = rotationAnimation.value * math.pi * 4;
        final isShowingHeads = (rotationValue / math.pi) % 2 < 1;
        final displayHeads = isFlipping ? isShowingHeads : isHeads;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(rotationValue),
          child: Container(
            width: 60.w,
            height: 60.w,
            constraints: BoxConstraints(
              maxWidth: 280,
              maxHeight: 280,
              minWidth: 200,
              minHeight: 200,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: displayHeads
                    ? [
                        AppTheme.coinGoldColor,
                        AppTheme.coinGoldColor.withValues(alpha: 0.8),
                        AppTheme.coinGoldColor.withValues(alpha: 0.6),
                      ]
                    : [
                        AppTheme.coinSilverColor,
                        AppTheme.coinSilverColor.withValues(alpha: 0.8),
                        AppTheme.coinSilverColor.withValues(alpha: 0.6),
                      ],
                stops: const [0.0, 0.7, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.brightness == Brightness.light
                      ? Colors.black.withValues(alpha: 0.2)
                      : Colors.white.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(isShowingHeads && isFlipping ? math.pi : 0),
                child: Text(
                  displayHeads ? 'H' : 'T',
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: displayHeads
                        ? const Color(0xFF8B4513)
                        : const Color(0xFF4A4A4A),
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
