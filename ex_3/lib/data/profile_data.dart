import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Choi Hyun-Wook",
  position: "Game Developer",
  avatarUrl: 'assets/p1.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+224 128 142"),
    TileData(icon: Icons.location_on, title: "Address", value: "444 Korea"),
    TileData(icon: Icons.email, title: "Mail", value: "hyukw00k@ss.kr"),
  ],
);
