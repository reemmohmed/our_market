part of 'rates_cubit.dart';

@immutable
sealed class RatesState {}

final class RatesInitial extends RatesState {}

final class RatesLoading extends RatesState {}

final class RatesSuccess extends RatesState {}

final class RatesFailure extends RatesState {}
