import 'package:ex_3/model/profile_tile_model.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key, required this.profile});
  final ProfileData profile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          if(profile.avatarUrl != null)
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profile.avatarUrl),
              ),
            ),
            Center(child: Text(profile.name)),
            Center(child: Text(profile.position)),

            for(final tile in profile.tiles)
              Card(
                child: ListTile(
                  leading: Icon(tile.icon),
                  title: Text(tile.title),
                  subtitle: Text(tile.value),
                ),
              )
            

        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
