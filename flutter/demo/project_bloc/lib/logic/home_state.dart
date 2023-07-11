// import 'dart:async';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingStae extends HomeState {}

class HomeLoadSuccess extends HomeState {}

class HomeNativagatetoWishListPageActionState extends HomeActionState {}
