import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'form_validator_state.dart';

class FormValidatorCubit extends Cubit<FormValidatorState> {
  FormValidatorCubit() : super(const FormValidatorUpdate());

  void initForm(
      {String email = '',
      String userName = '',
      String password = '',
      String confirmPassword = '',
      String firstName = '',
      String lastName = '',
      String phoneNumber = ''}) {
    emit(state.copyWith(
      email: email,
      userName: userName,
      password: password,
      confirmPassword: confirmPassword,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    ));
  }

  void updateUserName(String? userName) {
    emit(state.copyWith(userName: userName));
  }

  void updatePhoneNumber(String? phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void updateEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void updateConfirmPassword(String? confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void updateFirstName(String? firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void updateLastName(String? lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void updateAutovalidateMode(AutovalidateMode autovalidateMode) {
    emit(state.copyWith(autovalidateMode: autovalidateMode));
  }

  void toggleObscureText() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void reset() {
    emit(const FormValidatorUpdate());
  }
}
