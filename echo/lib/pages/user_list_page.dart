import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:echo/source/styles.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
