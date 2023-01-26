import 'package:e_commerce_app/core/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_values.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _changeLanguage() {}

  void _contactUs() {}

  void _inviteFriends() {}

  void _logout() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.p8),
        children: [
          MyListTile(
            leadingIcon: Icons.language_outlined,
            title: AppStrings.changeLanguage,
            onTap: () => _changeLanguage(),
          ),
          MyListTile(
            leadingIcon: Icons.call_missed_outgoing_outlined,
            title: AppStrings.contactUs,
            onTap: () => _contactUs(),
          ),
          MyListTile(
            leadingIcon: Icons.share_outlined,
            title: AppStrings.inviteYourFriends,
            onTap: () => _inviteFriends(),
          ),
          MyListTile(
            leadingIcon: Icons.logout_outlined,
            title: AppStrings.logout,
            onTap: () => _logout(),
          ),
        ],
      ),
    );
  }
}
