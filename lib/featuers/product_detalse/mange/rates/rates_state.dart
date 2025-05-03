part of 'rates_cubit.dart';

@immutable
sealed class RatesState {}

final class RatesInitial extends RatesState {}

final class RatesLoading extends RatesState {}

final class RatesSuccess extends RatesState {}

final class RatesFailure extends RatesState {}

final class AddOrPutchRateRateForUserLoding extends RatesState {}

final class AddOrPutchRateRateForUserSuccess extends RatesState {}

final class AddOrPutchRateRateForUserFailure extends RatesState {}

final class AddCoomentLoding extends RatesState {}

final class AddCoomentSuccess extends RatesState {}

final class AddCoomentFailure extends RatesState {}
