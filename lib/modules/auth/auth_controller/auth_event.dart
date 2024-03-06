import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvent extends Equatable {}

class GetHomePageDetails extends AuthEvent {
  final int num;

  GetHomePageDetails({required this.num});

  @override
  List<Object> get props =>[this.num];

}