import 'package:flutter/material.dart';

enum Role {
  admin(4, 'admin'),
  owner(3, 'owner'),
  stuff(2, 'stuff'),
  user(1, 'user'),
  ;

  const Role(this.level, this.name);

  factory Role.fromJson(String name) {
    return switch (name) {
      'admin' => Role.admin,
      'owner' => Role.owner,
      'stuff' => Role.stuff,
      'user' => Role.user,
      _ => Role.user
    };
  }
  final int level;
  final String name;

  /// list of all roles
  static List<Role> get all => Role.values;

  /// isAllowed method
  bool isAllowed(Role role) {
    return role.level >= level;
  }

  @override
  String toString() => name;
}

class Guard extends StatelessWidget {
  Guard({
    required this.allowed,
    required this.child,
    super.key,
    this.margin = EdgeInsets.zero,
  });

  final Widget child;
  final List<Role> allowed;
  final EdgeInsets margin;
// get from user bloc
  final Role role = Role.fromJson('admin');
  @override
  Widget build(BuildContext context) {
    return Visibility(
      key: key,
      visible: allowed.contains(role),
      child: Padding(
        padding: margin,
        child: child,
      ),
    );
  }
}

// Permissions not implemented yet

// 0 = No Permission
// 1 = Execute
// 2 = Write
// 4 = Read

// 0 = ---
// 1 = --x
// 2 = -w-
// 3 = -wx
// 4 = r--
// 5 = r-x
// 6 = rw-
// 7 = rwx
