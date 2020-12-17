import 'package:flutter/material.dart';

enum ServiceStatus { idle, busy, access, denied }

abstract class Controller extends ChangeNotifier {
  ServiceStatus status = ServiceStatus.idle;

  Future hasAccess();

  Controller() {
    hasAccess();
  }

  void updateStatus(ServiceStatus status) {
    this.status = status;
    notifyListeners();
  }

  @override
  String toString() {
    return status.toString();
  }
}
