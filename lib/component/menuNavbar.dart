import 'package:flutter/material.dart';

import 'genColor.dart';

class MenuNavbar {
  const MenuNavbar(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<MenuNavbar> allDestinations = <MenuNavbar>[
  MenuNavbar('Beranda', Icons.home_outlined),
  MenuNavbar('brg Masuk', Icons.assignment),
  MenuNavbar('brg Keluar', Icons.assignment),
  MenuNavbar('Profil', Icons.account_box_outlined),
];