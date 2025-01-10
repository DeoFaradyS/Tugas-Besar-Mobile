import 'package:flutter/material.dart';
import 'package:echo/DB/echo_api.dart';
import 'package:echo/Model/echo_api_model.dart';
import 'package:echo/source/styles.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<Users> listUsers = [];
  EchoApi echoApi = EchoApi();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      listUsers = await echoApi.getData();
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
            SizedBox(width: 84),
            Text(
              'User List',
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
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : listUsers.isEmpty
                ? const Center(
                    child: Text(
                      "No users available",
                      style: AppTypography.bodySemibold,
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    itemCount: listUsers.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          _buildUserCard("${index + 1}", listUsers[index].email),
                          const SizedBox(height: 8),
                        ],
                      );
                    },
                  ),
      ),
    );
  }

  Widget _buildUserCard(String number, String email) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColorGrayLight,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        children: [
          _buildNumber(number),
          const SizedBox(width: 24),
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

  Widget _buildUserInformation(String email) {
    return Row(
      children: [
        _buildProfilePicture(),
        const SizedBox(width: 16),
        _buildUserText(email),
      ],
    );
  }

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
