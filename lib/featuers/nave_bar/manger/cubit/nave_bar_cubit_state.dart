part of 'nave_bar_cubit_cubit.dart';

@immutable
sealed class NaveBarCubitState {}

final class NaveBarCubitInitial extends NaveBarCubitState {}

final class ChaneViewIndex extends NaveBarCubitState {
  final int currentIndex;

  ChaneViewIndex({required this.currentIndex});
}
