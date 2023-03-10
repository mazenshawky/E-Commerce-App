import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(AppPadding.p15),
        child: Column(
          children: [
            ...ListTile.divideTiles(
              color: AppColors.lightWhite,
              tiles: [
                MyListTile(
                  leadingIcon: Icons.person,
                  title: AppStrings.username,
                  subtitle: user.username,
                ),
                MyListTile(
                  leadingIcon: Icons.email,
                  title: AppStrings.email,
                  subtitle: user.email,
                ),
                MyListTile(
                  leadingIcon: Icons.phone,
                  title: AppStrings.phone,
                  subtitle: user.phone,
                ),
                MyListTile(
                  leadingIcon: Icons.location_city,
                  title: AppStrings.city,
                  subtitle: Constants.adjustText(user.address!.city),
                ),
                MyListTile(
                  leadingIcon: Icons.add_road,
                  title: AppStrings.street,
                  subtitle: Constants.adjustText(user.address!.street),
                ),
                MyListTile(
                  leadingIcon: Icons.location_history,
                  title: AppStrings.zipCode,
                  subtitle: user.address!.zipCode,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
