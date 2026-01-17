import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class ControlButtonsWidget extends StatelessWidget {
  final bool soundEnabled;
  final VoidCallback onSoundToggle;
  final VoidCallback onReset;

  const ControlButtonsWidget({
    super.key,
    required this.soundEnabled,
    required this.onSoundToggle,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildControlButton(
            context,
            icon: soundEnabled ? 'volume_up' : 'volume_off',
            onTap: onSoundToggle,
            tooltip: soundEnabled ? 'Mute' : 'Unmute',
          ),
          _buildControlButton(
            context,
            icon: 'refresh',
            onTap: onReset,
            tooltip: 'Reset Statistics',
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
    BuildContext context, {
    required String icon,
    required VoidCallback onTap,
    required String tooltip,
  }) {
    final theme = Theme.of(context);

    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
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
          child: CustomIconWidget(
            iconName: icon,
            color: theme.colorScheme.onSurface,
            size: 6.w,
          ),
        ),
      ),
    );
  }
}
