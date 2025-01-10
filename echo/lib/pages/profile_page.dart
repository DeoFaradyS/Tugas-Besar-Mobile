import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:echo/source/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,

      // --- App Bar ---
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
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
        elevation: 0,
      ),

      // --- Body ---
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: const [
            ProfileSection(),
            SizedBox(height: 24),
            MenuSection(),
          ],
        ),
      ),
    );
  }
}

// --- Profile Section ---
class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildProfilePicture(),
        const SizedBox(height: 16),
        _buildText(),
      ],
    );
  }

  // --- Profile Picture ---
  Widget _buildProfilePicture() {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage("assets/images/profile.png"),
    );
  }

  // --- Text ---
  Widget _buildText() {
    return Text(
      "example@gmail.com",
      style: AppTypography.bodyRegular.copyWith(
        color: AppColors.textGrayDark,
      ),
    );
  }
}

// --- Menu Section ---
class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildActionButton("Edit Profile", "assets/icons/edit.svg", () {}),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColorGrayLight,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              _buildActionButton("Cart", "assets/icons/cart.svg", () {}),
              _buildActionButton("History", "assets/icons/history.svg", () {}),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildActionButton("Log Out", "assets/icons/logout.svg", () {
          Navigator.pushNamed(context, '/login');
        }),
      ],
    );
  }

  // --- Action Button ---
  Widget _buildActionButton(String label, String iconPath, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buttonStyle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLeadingIconText(label, iconPath),
            _buildChevronIcon(),
          ],
        ),
      ),
    );
  }

  // --- Leading Icon Text ---
  Widget _buildLeadingIconText(label, iconPath) {
    return Row(
      children: [
        _buildIconButton(iconPath),
        const SizedBox(width: 16),
        _buildLabelButton(label),
      ],
    );
  }

  // --- Icon Button ---
  Widget _buildIconButton(path) {
    return SvgPicture.asset(
      path,
      height: 20,
      colorFilter: const ColorFilter.mode(
        AppColors.iconGrayDark,
        BlendMode.srcIn,
      ),
    );
  }

  // --- Label Button ---
  Widget _buildLabelButton(label) {
    return Text(
      label,
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.textGrayDark,
      ),
    );
  }

  // --- Chevron Icon ---
  Widget _buildChevronIcon() {
    return SvgPicture.asset(
      "assets/icons/chevron-right.svg",
      height: 20,
      colorFilter: const ColorFilter.mode(
        AppColors.iconGrayDark,
        BlendMode.srcIn,
      ),
    );
  }

  // --- Button Style ---
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.backgroundColorGrayLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 0,
      ),
      elevation: 0,
    );
  }
}
