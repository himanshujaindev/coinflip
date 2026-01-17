import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:audioplayers/audioplayers.dart';

import './widgets/coin_widget.dart';
import './widgets/control_buttons_widget.dart';
import './widgets/stats_widget.dart';

class MainCoinFlipScreen extends StatefulWidget {
  const MainCoinFlipScreen({super.key});

  @override
  MainCoinFlipScreenState createState() => MainCoinFlipScreenState();
}

class MainCoinFlipScreenState extends State<MainCoinFlipScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isFlipping = false;
  bool _isHeads = true;
  bool _soundEnabled = true;
  int _totalFlips = 0;
  int _headsCount = 0;
  int _tailsCount = 0;
  int _currentStreak = 0;
  bool _lastResultWasHeads = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isFlipping = false;
          _updateStats();
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _flipCoin() {
    if (_isFlipping) return;

    setState(() {
      _isFlipping = true;
      _isHeads = Random().nextBool();
    });

    if (_soundEnabled) {
      HapticFeedback.lightImpact();
      _playFlipSound();
    }

    _animationController.reset();
    _animationController.forward();
  }

  Future<void> _playFlipSound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/coin_flip.mp3'));
    } catch (e) {
      // Silent fail if sound file not available
    }
  }

  void _updateStats() {
    setState(() {
      _totalFlips++;
      if (_isHeads) {
        _headsCount++;
        if (_lastResultWasHeads) {
          _currentStreak++;
        } else {
          _currentStreak = 1;
          _lastResultWasHeads = true;
        }
      } else {
        _tailsCount++;
        if (!_lastResultWasHeads) {
          _currentStreak++;
        } else {
          _currentStreak = 1;
          _lastResultWasHeads = false;
        }
      }
    });
  }

  void _resetStats() {
    setState(() {
      _totalFlips = 0;
      _headsCount = 0;
      _tailsCount = 0;
      _currentStreak = 0;
      _lastResultWasHeads = true;
      _isHeads = true;
    });
  }

  void _toggleSound() {
    setState(() {
      _soundEnabled = !_soundEnabled;
    });
    if (_soundEnabled) {
      HapticFeedback.lightImpact();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              children: [
                SizedBox(height: 2.h),
                StatsWidget(
                  totalFlips: _totalFlips,
                  headsCount: _headsCount,
                  tailsCount: _tailsCount,
                  currentStreak: _currentStreak,
                  lastResultWasHeads: _lastResultWasHeads,
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _flipCoin,
                          onLongPress: () {
                            HapticFeedback.mediumImpact();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'Reset Statistics',
                                  style: theme.textTheme.titleLarge,
                                ),
                                content: Text(
                                  'Are you sure you want to reset all statistics?',
                                  style: theme.textTheme.bodyMedium,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'Cancel',
                                      style: theme.textTheme.labelLarge
                                          ?.copyWith(
                                            color: theme.colorScheme.secondary,
                                          ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _resetStats();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Reset',
                                      style: theme.textTheme.labelLarge
                                          ?.copyWith(
                                            color: theme.colorScheme.error,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: CoinWidget(
                            isHeads: _isHeads,
                            rotationAnimation: _rotationAnimation,
                            isFlipping: _isFlipping,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        AnimatedOpacity(
                          opacity: _isFlipping ? 0.0 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            _totalFlips == 0
                                ? 'Tap to Flip'
                                : (_isHeads ? 'Heads!' : 'Tails!'),
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ControlButtonsWidget(
                  soundEnabled: _soundEnabled,
                  onSoundToggle: _toggleSound,
                  onReset: () {
                    HapticFeedback.mediumImpact();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Reset Statistics',
                          style: theme.textTheme.titleLarge,
                        ),
                        content: Text(
                          'Are you sure you want to reset all statistics?',
                          style: theme.textTheme.bodyMedium,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Cancel',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _resetStats();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Reset',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 2.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
