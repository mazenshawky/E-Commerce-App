import 'package:e_commerce_app/core/utils/app_colors.dart';
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
          ListTile(
            leading:
                const Icon(Icons.language_outlined, color: AppColors.primary),
            title: Text(
              AppStrings.changeLanguage,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _changeLanguage(),
          ),
          ListTile(
            leading: const Icon(Icons.call_missed_outgoing_outlined,
                color: AppColors.primary),
            title: Text(
              AppStrings.contactUs,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _contactUs(),
          ),
          ListTile(
            leading: const Icon(Icons.share_outlined, color: AppColors.primary),
            title: Text(
              AppStrings.inviteYourFriends,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _inviteFriends(),
          ),
          ListTile(
            leading:
                const Icon(Icons.logout_outlined, color: AppColors.primary),
            title: Text(
              AppStrings.logout,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _logout(),
          ),
        ],
      ),
    );
  }
}
