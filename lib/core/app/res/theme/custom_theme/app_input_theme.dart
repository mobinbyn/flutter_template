import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/const/app_dimens.dart';
import 'package:flutter_template/core/app/res/const/app_font.dart';
import 'package:flutter_template/core/app/res/theme/color/app_palettes.dart';
import 'package:flutter_template/core/app/res/theme/app_text_style.dart';

import '../interface/i_app_theme.dart';

class AppInputTheme implements IAppTheme<InputDecorationTheme> {
  // Singleton instance
  static final AppInputTheme _instance = AppInputTheme._internal();

  // Private constructor to prevent object creation
  AppInputTheme._internal();

  // Factory method to return the singleton instance
  factory AppInputTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  InputDecorationTheme get lightTheme => InputDecorationTheme(
        ///********************************************************
        ///*               Common
        ///********************************************************
        fillColor: AppPalettes.neutral[99],
        iconColor: AppPalettes.neutral[70],
        prefixIconColor: AppPalettes.neutral[70],
        suffixIconColor: AppPalettes.neutral[70],
        contentPadding: AppPadding.textField,
        hintStyle: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s16, color: AppPalettes.neutral[70]!),
        labelStyle: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s16, color: AppPalettes.neutral[70]),
        floatingLabelStyle: AppTextStyle.getSemiBoldStyle(fontSize: AppFontSize.s12, color: AppPalettes.black),
        errorStyle: AppTextStyle.getRegularStyle(
          fontSize: AppFontSize.s12,
          color: AppPalettes.tertiary[30]!,
        ),
        suffixStyle: AppTextStyle.getSemiBoldStyle(
          fontSize: AppFontSize.s14,
          color: AppPalettes.neutral[80],
        ),
        prefixStyle: AppTextStyle.getSemiBoldStyle(
          fontSize: AppFontSize.s14,
          color: AppPalettes.neutral[80],
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 5, color: AppPalettes.secondary),
          // borderSide: BorderSide(width: 1, color: AppPalettes.neutral[90]!),
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.textField),
          ),
        ),

        ///********************************************************
        ///*               Normal Empty Mode
        ///********************************************************
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(width: 0, color: AppPalettes.neutral[100]!),
          borderSide: BorderSide(width: 1, color: AppPalettes.neutral[90]!),
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.textField),
          ),
        ),

        ///********************************************************
        ///*               Normal Filled Mode
        ///********************************************************

        ///********************************************************
        ///*               Focused Mode
        ///********************************************************
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppPalettes.primary[50]!),
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.textField),
          ),
        ),

        ///********************************************************
        ///*               Disable Mode
        ///********************************************************
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.textField),
          ),
          borderSide: BorderSide(width: 1, color: AppPalettes.neutral[99]!),
        ),

        ///********************************************************
        ///*               Focused on Error Mode
        ///********************************************************
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppPalettes.tertiary[30]!),
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.textField),
          ),
        ),

        ///********************************************************
        ///*               Error Mode
        ///********************************************************
        errorMaxLines: 1,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppPalettes.tertiary[30]!),
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.textField),
          ),
        ),
      );

  @override
  InputDecorationTheme get darkTheme => const InputDecorationTheme(
        labelStyle: null,
        floatingLabelStyle: null,
        helperStyle: null,
        helperMaxLines: null,
        hintStyle: null,
        hintFadeDuration: null,
        errorStyle: null,
        errorMaxLines: null,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        isDense: false,
        contentPadding: null,
        isCollapsed: false,
        iconColor: null,
        prefixStyle: null,
        prefixIconColor: null,
        suffixStyle: null,
        suffixIconColor: null,
        counterStyle: null,
        filled: false,
        fillColor: null,
        activeIndicatorBorder: null,
        outlineBorder: null,
        focusColor: null,
        hoverColor: null,
        errorBorder: null,
        focusedBorder: null,
        focusedErrorBorder: null,
        disabledBorder: null,
        enabledBorder: null,
        border: null,
        alignLabelWithHint: false,
        constraints: null,
      );
}
