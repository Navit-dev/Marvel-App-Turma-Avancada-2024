
import 'package:flutter/material.dart';

enum NavitMarvelAssets {
  bg01('assets/bg_01.jpeg'),
  bg02('assets/bg_02.jpeg'),
  bg03('assets/bg_03.jpeg'),
  bg04('assets/bg_04.jpeg');

  final String localUri;

  const NavitMarvelAssets(this.localUri);

  ImageProvider get imageProvider => AssetImage(localUri);
}
