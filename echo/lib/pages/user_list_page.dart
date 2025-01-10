import 'package:flutter/material.dart';
import 'package:echo/source/styles.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,

      // --- App Bar ---
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        title: const Row(
          children: [
            SizedBox(width: 88),
            Text(
              'Profile',
              style: AppTypography.heading3Semibold,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textGrayDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // --- Body ---
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: [
            _buildUserCard("01","example"),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(number, String email) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.backgroundColorGrayLight,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    child: Row(
      children: [
        _buildNumber(number),
        const SizedBox(width: 24), // Mengganti height dengan width
        _buildUserInformation(email),
      ],
    ),
  );
}

  Widget _buildNumber(String number) {
    return Text(
      number,
      style: AppTypography.bodyLargeSemibold.copyWith(
        color: AppColors.textGrayMedium,
      ),
    );
  }

  // --- User Information ---
  Widget _buildUserInformation(String email) {
    return Row(
      children: [
        _buildProfilePicture(),
        const SizedBox(width: 16),
        _buildUserText(email),
      ],
    );
  }

  // --- Profile Picture ---
  Widget _buildProfilePicture() {
    return const CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage('assets/images/profile.png'),
    );
  }

  Widget _buildUserText(String email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: AppTypography.captionRegular.copyWith(
            color: AppColors.textGrayDark,
          ),
        ),
        Text(
          email,
          style: AppTypography.bodySemibold.copyWith(
            color: AppColors.textGrayDark,
          ),
        ),
      ],
    );
  }
}
