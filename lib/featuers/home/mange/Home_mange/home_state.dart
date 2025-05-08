part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetDataLoading extends HomeState {}

final class GetDataSuccess extends HomeState {}

final class GetDataError extends HomeState {}

final class AddToFavourtesLoading extends HomeState {}

final class AddToFavourtesSuccess extends HomeState {}

final class AddToFavourtesError extends HomeState {}

final class RemoveFromFavourtesLoading extends HomeState {}

final class RemoveFromFavourtesSuccess extends HomeState {}

final class RemoveFromFavourtesError extends HomeState {}
