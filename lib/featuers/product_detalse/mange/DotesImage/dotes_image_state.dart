part of 'dotes_image_cubit.dart';

@immutable
sealed class DotesImageState {}

final class DotesImageInitial extends DotesImageState {}

class ChaneViewIndex extends DotesImageState {
  final int currentIndex;
  ChaneViewIndex({required this.currentIndex});
}
