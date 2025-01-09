import 'package:echo/source/styles.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profilee'),
      body: Center(
        child: Text('Ini adalah halaman profil.'),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      title: _buildTitle(),
      leading: _buildLeadingIcon(context),
      elevation: 0,
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        title,
        style: AppTypography.heading3Semibold
      ),
    );
  }

  Widget _buildLeadingIcon(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.textGrayDark
        ),
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.pop(context); 
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
