import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section with Badges
          _buildImageSection(),

          // Content Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: AppConstants.fontSizeLarge,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: AppConstants.paddingMedium),

                    // Project Details
                    _buildDetailRow('Allocated Budget:', allocatedBudget),
                    _buildDetailRow('Project Code:', projectCode),
                    _buildDetailRow('Project Contractor:', contractor),
                    _buildDetailRow('Location:', location),

                    const SizedBox(height: AppConstants.paddingMedium),

                    // Budget Info
                    _buildBudgetRow(),

                    const SizedBox(height: AppConstants.paddingMedium),

                    // Description
                    Text(
                      'Description:',
                      style: const TextStyle(
                        fontSize: AppConstants.fontSizeSmall,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: AppConstants.fontSizeSmall,
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        // Image
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppConstants.radiusLarge),
            topRight: Radius.circular(AppConstants.radiusLarge),
          ),
          child: Container(
            height: 200,
            width: double.infinity,
            color: AppColors.lightGrey,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.lightGrey,
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.image,
                      size: 48,
                      color: AppColors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Status Badge
        Positioned(
          top: AppConstants.paddingMedium,
          left: AppConstants.paddingMedium,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingSmall,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontSize: AppConstants.fontSizeSmall,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),

        // Deadline Badge
        Positioned(
          top: AppConstants.paddingMedium,
          right: AppConstants.paddingMedium,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingSmall,
            ),
            decoration: BoxDecoration(
              color: AppColors.error,
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Text(
              deadline,
              style: const TextStyle(
                fontSize: AppConstants.fontSizeSmall,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.paddingSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: AppConstants.fontSizeSmall,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: AppConstants.fontSizeSmall,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetRow() {
    return Row(
      children: [
        const SizedBox(
          width: 140,
          child: Text(
            'Budget Spent:',
            style: TextStyle(
              fontSize: AppConstants.fontSizeSmall,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Text(
                budgetSpent,
                style: const TextStyle(
                  fontSize: AppConstants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: AppColors.error,
                ),
              ),
              const SizedBox(width: AppConstants.paddingSmall),
              Text(
                dateRange,
                style: const TextStyle(
                  fontSize: AppConstants.fontSizeSmall,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
