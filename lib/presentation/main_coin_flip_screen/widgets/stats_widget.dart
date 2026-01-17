import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../theme/app_theme.dart';

class StatsWidget extends StatelessWidget {
  final int totalFlips;
  final int headsCount;
  final int tailsCount;
  final int currentStreak;
  final bool lastResultWasHeads;

  const StatsWidget({
    super.key,
    required this.totalFlips,
    required this.headsCount,
    required this.tailsCount,
    required this.currentStreak,
    required this.lastResultWasHeads,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.light
                ? Colors.black.withValues(alpha: 0.05)
                : Colors.white.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                context,
                'Total Flips',
                totalFlips.toString(),
                theme.colorScheme.primary,
              ),
              Container(
                width: 1,
                height: 8.h,
                color: theme.colorScheme.outline.withValues(alpha: 0.3),
              ),
              _buildStatItem(
                context,
                'Current Streak',
                currentStreak.toString(),
                lastResultWasHeads
                    ? AppTheme.coinGoldColor
                    : AppTheme.coinSilverColor,
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildResultItem(
                context,
                'Heads',
                headsCount.toString(),
                totalFlips > 0
                    ? ((headsCount / totalFlips) * 100).toStringAsFixed(1)
                    : '0.0',
                AppTheme.coinGoldColor,
              ),
              _buildResultItem(
                context,
                'Tails',
                tailsCount.toString(),
                totalFlips > 0
                    ? ((tailsCount / totalFlips) * 100).toStringAsFixed(1)
                    : '0.0',
                AppTheme.coinSilverColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            value,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultItem(
    BuildContext context,
    String label,
    String count,
    String percentage,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              count,
              style: theme.textTheme.titleLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '$percentage%',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
