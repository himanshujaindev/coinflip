import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that contains all theme configurations for the coin flip application.
/// Implements Refined Minimalism design with Adaptive Neutrals color palette.
class AppTheme {
  AppTheme._();

  // Color Specifications - Adaptive Neutrals Palette
  // Light Theme Colors
  static const Color primaryLight = Color(0xFF1A1A1A); // Deep charcoal
  static const Color secondaryLight = Color(0xFF6B7280); // Neutral gray
  static const Color accentLight = Color(0xFF3B82F6); // Clean blue
  static const Color backgroundLight = Color(0xFFFFFFFF); // Pure white
  static const Color surfaceLight = Color(0xFFF9FAFB); // Subtle off-white
  static const Color coinGold = Color(0xFFFFD700); // Classic gold
  static const Color coinSilver = Color(0xFFC0C0C0); // Traditional silver
  static const Color successLight = Color(0xFF10B981); // Emerald green
  static const Color borderLight = Color(0xFFE5E7EB); // Light gray
  static const Color shadowLight = Color(0x14000000); // 8% opacity black
  static const Color errorLight = Color(0xFFEF4444); // Red for errors

  // Dark Theme Colors
  static const Color primaryDark = Color(0xFFFFFFFF); // White text
  static const Color secondaryDark = Color(0xFF9CA3AF); // Lighter gray
  static const Color accentDark = Color(0xFF60A5FA); // Lighter blue
  static const Color backgroundDark = Color(0xFF0F0F0F); // Near black
  static const Color surfaceDark = Color(0xFF1A1A1A); // Dark surface
  static const Color successDark = Color(0xFF34D399); // Lighter emerald
  static const Color borderDark = Color(0xFF374151); // Dark gray
  static const Color shadowDark = Color(0x14FFFFFF); // 8% opacity white
  static const Color errorDark = Color(0xFFF87171); // Lighter red

  // Text emphasis colors
  static const Color textHighEmphasisLight = Color(0xFF1A1A1A); // 100% opacity
  static const Color textMediumEmphasisLight = Color(0xFF6B7280); // 60% opacity
  static const Color textDisabledLight = Color(0xFFD1D5DB); // 38% opacity

  static const Color textHighEmphasisDark = Color(0xFFFFFFFF); // 100% opacity
  static const Color textMediumEmphasisDark = Color(0xFF9CA3AF); // 60% opacity
  static const Color textDisabledDark = Color(0xFF4B5563); // 38% opacity

  /// Light theme - Confident Clarity visual mood
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryLight,
      onPrimary: backgroundLight,
      primaryContainer: surfaceLight,
      onPrimaryContainer: primaryLight,
      secondary: secondaryLight,
      onSecondary: backgroundLight,
      secondaryContainer: surfaceLight,
      onSecondaryContainer: secondaryLight,
      tertiary: accentLight,
      onTertiary: backgroundLight,
      tertiaryContainer: surfaceLight,
      onTertiaryContainer: accentLight,
      error: errorLight,
      onError: backgroundLight,
      surface: surfaceLight,
      onSurface: primaryLight,
      onSurfaceVariant: secondaryLight,
      outline: borderLight,
      outlineVariant: borderLight,
      shadow: shadowLight,
      scrim: shadowLight,
      inverseSurface: surfaceDark,
      onInverseSurface: primaryDark,
      inversePrimary: accentLight,
    ),
    scaffoldBackgroundColor: backgroundLight,
    cardColor: surfaceLight,
    dividerColor: borderLight,

    // AppBar theme - minimal elevation for clean aesthetic
    appBarTheme: AppBarThemeData(
      backgroundColor: backgroundLight,
      foregroundColor: primaryLight,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryLight,
        letterSpacing: 0.15,
      ),
      iconTheme: const IconThemeData(color: primaryLight, size: 24),
    ),

    // Card theme - subtle elevation with rounded corners
    cardTheme: CardThemeData(
      color: surfaceLight,
      elevation: 2.0,
      shadowColor: shadowLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.all(8.0),
    ),

    // Bottom navigation - fixed type for consistent layout
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: backgroundLight,
      selectedItemColor: primaryLight,
      unselectedItemColor: secondaryLight,
      type: BottomNavigationBarType.fixed,
      elevation: 8.0,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Floating action button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accentLight,
      foregroundColor: backgroundLight,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),

    // Button themes - consistent with design system
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: backgroundLight,
        backgroundColor: primaryLight,
        elevation: 2.0,
        shadowColor: shadowLight,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: const BorderSide(color: borderLight, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accentLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    // Text theme - Inter font family with defined weights
    textTheme: _buildTextTheme(isLight: true),

    // Input decoration - minimal borders with focus states
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: surfaceLight,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderLight, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderLight, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: accentLight, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorLight, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorLight, width: 2),
      ),
      labelStyle: GoogleFonts.inter(
        color: secondaryLight,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: textDisabledLight,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: GoogleFonts.inter(
        color: errorLight,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Switch theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentLight;
        }
        return secondaryLight;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentLight.withValues(alpha: 0.5);
        }
        return borderLight;
      }),
    ),

    // Checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentLight;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(backgroundLight),
      side: const BorderSide(color: borderLight, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // Radio theme
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentLight;
        }
        return secondaryLight;
      }),
    ),

    // Progress indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: accentLight,
      linearTrackColor: borderLight,
      circularTrackColor: borderLight,
    ),

    // Slider theme
    sliderTheme: SliderThemeData(
      activeTrackColor: accentLight,
      thumbColor: accentLight,
      overlayColor: accentLight.withValues(alpha: 0.2),
      inactiveTrackColor: borderLight,
      valueIndicatorColor: primaryLight,
      valueIndicatorTextStyle: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Tab bar theme
    tabBarTheme: TabBarThemeData(
      labelColor: primaryLight,
      unselectedLabelColor: secondaryLight,
      indicatorColor: accentLight,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
    ),

    // Tooltip theme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: primaryLight.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),

    // Snackbar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: primaryLight,
      contentTextStyle: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      actionTextColor: accentLight,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 4.0,
    ),

    // Bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: backgroundLight,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      modalBackgroundColor: backgroundLight,
      modalElevation: 8.0,
    ),

    // Dialog theme
    dialogTheme: DialogThemeData(
      backgroundColor: surfaceLight,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryLight,
        letterSpacing: 0.15,
      ),
      contentTextStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: secondaryLight,
        letterSpacing: 0.25,
      ),
    ),
  );

  /// Dark theme - Confident Clarity visual mood for dark mode
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: primaryDark,
      onPrimary: backgroundDark,
      primaryContainer: surfaceDark,
      onPrimaryContainer: primaryDark,
      secondary: secondaryDark,
      onSecondary: backgroundDark,
      secondaryContainer: surfaceDark,
      onSecondaryContainer: secondaryDark,
      tertiary: accentDark,
      onTertiary: backgroundDark,
      tertiaryContainer: surfaceDark,
      onTertiaryContainer: accentDark,
      error: errorDark,
      onError: backgroundDark,
      surface: surfaceDark,
      onSurface: primaryDark,
      onSurfaceVariant: secondaryDark,
      outline: borderDark,
      outlineVariant: borderDark,
      shadow: shadowDark,
      scrim: shadowDark,
      inverseSurface: surfaceLight,
      onInverseSurface: primaryLight,
      inversePrimary: accentDark,
    ),
    scaffoldBackgroundColor: backgroundDark,
    cardColor: surfaceDark,
    dividerColor: borderDark,

    // AppBar theme
    appBarTheme: AppBarThemeData(
      backgroundColor: backgroundDark,
      foregroundColor: primaryDark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryDark,
        letterSpacing: 0.15,
      ),
      iconTheme: const IconThemeData(color: primaryDark, size: 24),
    ),

    // Card theme
    cardTheme: CardThemeData(
      color: surfaceDark,
      elevation: 2.0,
      shadowColor: shadowDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.all(8.0),
    ),

    // Bottom navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: backgroundDark,
      selectedItemColor: primaryDark,
      unselectedItemColor: secondaryDark,
      type: BottomNavigationBarType.fixed,
      elevation: 8.0,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Floating action button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accentDark,
      foregroundColor: backgroundDark,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: backgroundDark,
        backgroundColor: primaryDark,
        elevation: 2.0,
        shadowColor: shadowDark,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryDark,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: const BorderSide(color: borderDark, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accentDark,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    // Text theme
    textTheme: _buildTextTheme(isLight: false),

    // Input decoration
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: surfaceDark,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderDark, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderDark, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: accentDark, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorDark, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorDark, width: 2),
      ),
      labelStyle: GoogleFonts.inter(
        color: secondaryDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: textDisabledDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: GoogleFonts.inter(
        color: errorDark,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Switch theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentDark;
        }
        return secondaryDark;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentDark.withValues(alpha: 0.5);
        }
        return borderDark;
      }),
    ),

    // Checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentDark;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(backgroundDark),
      side: const BorderSide(color: borderDark, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // Radio theme
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentDark;
        }
        return secondaryDark;
      }),
    ),

    // Progress indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: accentDark,
      linearTrackColor: borderDark,
      circularTrackColor: borderDark,
    ),

    // Slider theme
    sliderTheme: SliderThemeData(
      activeTrackColor: accentDark,
      thumbColor: accentDark,
      overlayColor: accentDark.withValues(alpha: 0.2),
      inactiveTrackColor: borderDark,
      valueIndicatorColor: primaryDark,
      valueIndicatorTextStyle: GoogleFonts.inter(
        color: backgroundDark,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Tab bar theme
    tabBarTheme: TabBarThemeData(
      labelColor: primaryDark,
      unselectedLabelColor: secondaryDark,
      indicatorColor: accentDark,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
    ),

    // Tooltip theme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: primaryDark.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: GoogleFonts.inter(
        color: backgroundDark,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),

    // Snackbar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: surfaceDark,
      contentTextStyle: GoogleFonts.inter(
        color: primaryDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      actionTextColor: accentDark,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 4.0,
    ),

    // Bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: backgroundDark,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      modalBackgroundColor: backgroundDark,
      modalElevation: 8.0,
    ),

    // Dialog theme
    dialogTheme: DialogThemeData(
      backgroundColor: surfaceDark,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryDark,
        letterSpacing: 0.15,
      ),
      contentTextStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: secondaryDark,
        letterSpacing: 0.25,
      ),
    ),
  );

  /// Helper method to build text theme based on brightness
  /// Uses Inter font family with specified weights for headings, body, and captions
  /// SF Mono used for data/numerical displays
  static TextTheme _buildTextTheme({required bool isLight}) {
    final Color textHighEmphasis = isLight
        ? textHighEmphasisLight
        : textHighEmphasisDark;
    final Color textMediumEmphasis = isLight
        ? textMediumEmphasisLight
        : textMediumEmphasisDark;
    final Color textDisabled = isLight ? textDisabledLight : textDisabledDark;

    return TextTheme(
      // Display styles - Inter w700 for maximum impact
      displayLarge: GoogleFonts.inter(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        color: textHighEmphasis,
        letterSpacing: -0.25,
        height: 1.12,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.16,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.22,
      ),

      // Headline styles - Inter w600 for section headers
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.29,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.33,
      ),

      // Title styles - Inter w400-w600 for UI elements
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textHighEmphasis,
        letterSpacing: 0,
        height: 1.27,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.15,
        height: 1.50,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.1,
        height: 1.43,
      ),

      // Body styles - Inter w300-w500 for content
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
        letterSpacing: 0.5,
        height: 1.50,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
        letterSpacing: 0.25,
        height: 1.43,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: textMediumEmphasis,
        letterSpacing: 0.4,
        height: 1.33,
      ),

      // Label styles - Inter w400-w500 for captions and labels
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.1,
        height: 1.43,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textMediumEmphasis,
        letterSpacing: 0.5,
        height: 1.33,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: textDisabled,
        letterSpacing: 0.5,
        height: 1.45,
      ),
    );
  }

  /// Custom color getters for coin-specific colors
  static Color get coinGoldColor => coinGold;
  static Color get coinSilverColor => coinSilver;

  /// Custom color getters for success states
  static Color successColor(bool isLight) =>
      isLight ? successLight : successDark;

  /// Custom shadow configuration for coin elevation
  static List<BoxShadow> coinShadow(bool isLight, {double elevation = 4.0}) {
    return [
      BoxShadow(
        color: isLight ? shadowLight : shadowDark,
        blurRadius: elevation * 2,
        offset: Offset(0, elevation / 2),
      ),
    ];
  }

  /// Animation duration constants (200-600ms range)
  static const Duration microInteraction = Duration(milliseconds: 200);
  static const Duration standardAnimation = Duration(milliseconds: 300);
  static const Duration coinFlipAnimation = Duration(milliseconds: 600);
  static const Duration modalPresentation = Duration(milliseconds: 250);
}
