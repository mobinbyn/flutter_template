// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class IAppThemeStrategy<T> {
  final String label;

  IAppThemeStrategy(this.label);

  T? get theme;
}
