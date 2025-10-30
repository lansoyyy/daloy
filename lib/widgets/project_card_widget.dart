import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../screens/project_detail_screen.dart';

class ProjectCardWidget extends StatelessWidget {
  final String title;
  final String projectCode;
  final String contractor;
  final String location;
  final String budgetSpent;
  final String allocatedBudget;
  final String dateRange;
  final String description;
  final String status;
  final String deadline;
  final String imageUrl;

  const ProjectCardWidget({
    super.key,
    required this.title,
    required this.projectCode,
    required this.contractor,
    required this.location,
    required this.budgetSpent,
    required this.allocatedBudget,
    required this.dateRange,
    required this.description,
    required this.status,
    required this.deadline,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isDesktop = screenWidth >= 1024;

    return Material(
      elevation: isDesktop ? 6 : 3,
      borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      child: AnimatedContainer(
        duration: AppConstants.animationShort,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: isDesktop ? 16 : 12,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectDetailScreen(
                  projectId: projectCode,
                  title: title,
                  projectCode: projectCode,
                  contractor: contractor,
                  location: location,
                  budgetSpent: budgetSpent,
                  allocatedBudget: allocatedBudget,
                  dateRange: dateRange,
                  description: description,
                  imageUrl: imageUrl,
                ),
              ),
            );
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section with Badges
                _buildImageSection(isMobile),

                // Content Section
                Padding(
                  padding: EdgeInsets.all(isMobile
                      ? AppConstants.paddingMedium
                      : AppConstants.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          height: 1.3,
                          letterSpacing: -0.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: isMobile ? 12 : 16),

                      // Info Grid
                      _buildInfoGrid(isMobile),

                      SizedBox(height: isMobile ? 12 : 16),

                      // Description
                      Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          color: AppColors.textSecondary,
                          height: 1.5,
                          letterSpacing: 0.1,
                        ),
                        maxLines: isMobile ? 4 : 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(bool isMobile) {
    return Stack(
      children: [
        // Image
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppConstants.radiusLarge),
            topRight: Radius.circular(AppConstants.radiusLarge),
          ),
          child: Container(
            height: isMobile ? 150 : 200,
            width: double.infinity,
            color: AppColors.lightGrey,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.lightGrey,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.image,
                      size: isMobile ? 32 : 48,
                      color: AppColors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Gradient overlay for better text readability
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppConstants.radiusLarge),
            topRight: Radius.circular(AppConstants.radiusLarge),
          ),
          child: Container(
            height: isMobile ? 150 : 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ),

        // Status Badge
        Positioned(
          top:
              isMobile ? AppConstants.paddingSmall : AppConstants.paddingMedium,
          left:
              isMobile ? AppConstants.paddingSmall : AppConstants.paddingMedium,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? AppConstants.paddingSmall
                  : AppConstants.paddingMedium,
              vertical: isMobile ? 4 : AppConstants.paddingSmall,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: isMobile ? 10 : AppConstants.fontSizeSmall,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),

        // Deadline Badge
        Positioned(
          top:
              isMobile ? AppConstants.paddingSmall : AppConstants.paddingMedium,
          right:
              isMobile ? AppConstants.paddingSmall : AppConstants.paddingMedium,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? AppConstants.paddingSmall
                  : AppConstants.paddingMedium,
              vertical: isMobile ? 4 : AppConstants.paddingSmall,
            ),
            decoration: BoxDecoration(
              color: AppColors.error,
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              deadline,
              style: TextStyle(
                fontSize: isMobile ? 10 : AppConstants.fontSizeSmall,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoGrid(bool isMobile) {
    return Column(
      children: [
        // Row 1: Date Range and Budget Spent
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateRange,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Budget Spent:',
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    budgetSpent,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: isMobile ? 8 : 10),

        // Row 2: Allocated Budget and Project Code
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Allocated Budget:',
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    allocatedBudget,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Project Code:',
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    projectCode,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: isMobile ? 8 : 10),

        // Row 3: Project Contractor and Location
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Project Contractor:',
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    contractor,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location:',
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
