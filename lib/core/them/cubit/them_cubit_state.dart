part of 'them_cubit_cubit.dart';

@immutable
sealed class ThemCubitState {}

final class ThemCubitInitial extends ThemCubitState {}

class ThemLoaded extends ThemCubitState {
  final bool isDarkTheme;
  ThemLoaded(this.isDarkTheme);
}
