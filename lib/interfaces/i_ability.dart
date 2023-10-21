import 'dart:ffi';

import 'package:flutter/material.dart';

abstract class IAbility {
  String? name;
  String? url;
}

abstract class IAbilitie{
  IAbility? ability;
  Bool? is_hidden;
  String? slot;
}