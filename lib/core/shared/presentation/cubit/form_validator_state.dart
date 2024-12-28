part of 'form_validator_cubit.dart';

@immutable
abstract class FormValidatorState extends Equatable {
  final AutovalidateMode autovalidateMode;
  final String email;
  final String userName;
  final String password;
  final String confirmPassword;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final bool obscureText;

  const FormValidatorState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.email = '',
    this.userName = '',
    this.password = '',
    this.confirmPassword = '',
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.obscureText = false,
  });

  FormValidatorState copyWith({
    AutovalidateMode? autovalidateMode,
    String? email,
    String? userName,
    String? password,
    String? confirmPassword,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    bool? obscureText,
  });

  @override
  List<Object> get props => [
        autovalidateMode,
        email,
        userName,
        password,
        confirmPassword,
        firstName,
        lastName,
        phoneNumber,
        obscureText,
      ];
}

class FormValidatorUpdate extends FormValidatorState {
  const FormValidatorUpdate({
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    String email = '',
    String userName = '',
    String password = '',
    String confirmPassword = '',
    String firstName = '',
    String lastName = '',
    String phoneNumber = '',
    bool obscureText = true,
  }) : super(
          autovalidateMode: autovalidateMode,
          email: email,
          userName: userName,
          password: password,
          confirmPassword: confirmPassword,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          obscureText: obscureText,
        );

  @override
  FormValidatorUpdate copyWith({
    AutovalidateMode? autovalidateMode,
    String? email,
    String? userName,
    String? password,
    String? confirmPassword,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    bool? obscureText,
  }) {
    return FormValidatorUpdate(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
