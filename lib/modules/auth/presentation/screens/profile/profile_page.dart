import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/widgets/my_header.dart';
import 'package:e_commerce_app/modules/auth/presentation/components/profile_card.dart';
import 'package:e_commerce_app/modules/auth/presentation/components/profile_image.dart';
import 'package:e_commerce_app/modules/auth/presentation/cubit/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is ProfileLoaded) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                const SizedBox(
                    height: AppSize.s100,
                    child: MyHeader(height: AppSize.s100)),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppMargins.m25, vertical: AppMargins.m10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p10, vertical: AppPadding.p0),
                  child: Column(
                    children: [
                      const ProfileImage(),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Constants.adjustText(state.user.name.firstname),
                            style: const TextStyle(
                              fontSize: FontSize.s22,
                              fontWeight: FontWeights.fwBold,
                            ),
                          ),
                          const SizedBox(width: AppSize.s8),
                          Text(
                            Constants.adjustText(state.user.name.lastname),
                            style: const TextStyle(
                              fontSize: FontSize.s22,
                              fontWeight: FontWeights.fwBold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(AppPadding.p10),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p8, bottom: AppPadding.p4),
                              alignment: Alignment.topLeft,
                              child: const Text(
                                AppStrings.userInformation,
                                style: TextStyle(
                                  color: AppColors.blackColor87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontSize.s16,
                                ),
                              ),
                            ),
                            ProfileCard(user: state.user),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
