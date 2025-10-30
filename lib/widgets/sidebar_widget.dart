import 'package:daloy/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({super.key});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  String selectedMenu = 'Projects';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Section
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Image.asset(
              AppAssets.logo,
              height: 35,
            ),
          ),

          const SizedBox(height: AppConstants.paddingMedium),

          // Project Related Section
          _buildSectionHeader('Project Related'),

          _buildMenuItem(
            icon: FontAwesomeIcons.tableColumns,
            label: 'Projects',
            isSelected: selectedMenu == 'Projects',
            onTap: () => setState(() => selectedMenu = 'Projects'),
          ),
          _buildMenuItem(
            icon: FontAwesomeIcons.peopleGroup,
            label: 'Engineering',
            isSelected: selectedMenu == 'Engineering',
            onTap: () => setState(() => selectedMenu = 'Engineering'),
          ),
          _buildMenuItem(
            icon: FontAwesomeIcons.building,
            label: 'Accounting',
            isSelected: selectedMenu == 'Accounting',
            onTap: () => setState(() => selectedMenu = 'Accounting'),
          ),
          _buildMenuItem(
            icon: FontAwesomeIcons.chartLine,
            label: 'Monitoring',
            isSelected: selectedMenu == 'Monitoring',
            onTap: () => setState(() => selectedMenu = 'Monitoring'),
          ),
          _buildMenuItem(
            icon: FontAwesomeIcons.calculator,
            label: 'Budget',
            isSelected: selectedMenu == 'Budget',
            onTap: () => setState(() => selectedMenu = 'Budget'),
          ),
          _buildMenuItem(
            icon: FontAwesomeIcons.creditCard,
            label: 'Treasurer',
            isSelected: selectedMenu == 'Treasurer',
            onTap: () => setState(() => selectedMenu = 'Treasurer'),
          ),

          const SizedBox(height: AppConstants.paddingLarge),

          // Tools Section
          _buildSectionHeader('Tools'),

          _buildMenuItem(
            icon: FontAwesomeIcons.comments,
            label: 'Chats',
            isSelected: selectedMenu == 'Chats',
            onTap: () => setState(() => selectedMenu = 'Chats'),
          ),
          _buildMenuItem(
            icon: FontAwesomeIcons.users,
            label: 'Users',
            isSelected: selectedMenu == 'Users',
            onTap: () => setState(() => selectedMenu = 'Users'),
          ),

          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingLarge,
        vertical: AppConstants.paddingSmall,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: AppConstants.fontSizeSmall,
          fontWeight: FontWeight.w600,
          color: AppColors.accent,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingLarge,
          vertical: AppConstants.paddingMedium,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Row(
          children: [
            FaIcon(
              icon,
              size: 18,
              color: isSelected ? AppColors.primary : AppColors.grey,
            ),
            const SizedBox(width: AppConstants.paddingMedium),
            Text(
              label,
              style: TextStyle(
                fontSize: AppConstants.fontSizeMedium,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
