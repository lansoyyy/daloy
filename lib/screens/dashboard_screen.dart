import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/stat_card_widget.dart';
import '../widgets/project_card_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // Sidebar
          const SidebarWidget(),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Top Bar
                _buildTopBar(),

                // Main Content Area
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppConstants.paddingLarge),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Breadcrumb
                        _buildBreadcrumb(),

                        const SizedBox(height: AppConstants.paddingLarge),

                        // Statistics Cards
                        _buildStatisticsCards(),

                        const SizedBox(height: AppConstants.paddingExtraLarge),

                        // Projects Section Header
                        _buildProjectsHeader(),

                        const SizedBox(height: AppConstants.paddingLarge),

                        // Projects Grid
                        _buildProjectsGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingLarge,
        vertical: AppConstants.paddingMedium,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Spacer(),

          // Notification Icon
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell, size: 20),
            color: AppColors.primary,
            onPressed: () {},
          ),

          const SizedBox(width: AppConstants.paddingMedium),

          // User Profile
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingSmall,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.primary,
                  child: const FaIcon(
                    FontAwesomeIcons.user,
                    size: 16,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: AppConstants.paddingSmall),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: AppConstants.fontSizeMedium,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: AppConstants.paddingSmall),
                const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: 12,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.house,
            size: 14,
            color: AppColors.primary,
          ),
          label: const Text(
            'HOME',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: AppConstants.fontSizeMedium,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const FaIcon(
          FontAwesomeIcons.chevronRight,
          size: 12,
          color: AppColors.grey,
        ),
      ],
    );
  }

  Widget _buildStatisticsCards() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive grid columns
        int crossAxisCount = 4;
        if (constraints.maxWidth < 900) crossAxisCount = 2;
        if (constraints.maxWidth < 600) crossAxisCount = 1;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: AppConstants.paddingMedium,
          mainAxisSpacing: AppConstants.paddingMedium,
          childAspectRatio: 2.5,
          children: const [
            StatCardWidget(
              title: 'Total Projects',
              value: '80',
              subtitle: 'projects',
              color: AppColors.primary,
              icon: FontAwesomeIcons.arrowRight,
            ),
            StatCardWidget(
              title: 'Active Projects',
              value: '55',
              subtitle: 'projects',
              color: AppColors.secondary,
              icon: FontAwesomeIcons.arrowRight,
            ),
            StatCardWidget(
              title: 'Completed',
              value: '20',
              subtitle: 'projects',
              color: AppColors.accent,
              icon: FontAwesomeIcons.arrowRight,
            ),
            StatCardWidget(
              title: 'Terminated',
              value: '5',
              subtitle: 'projects',
              color: AppColors.error,
              icon: FontAwesomeIcons.arrowRight,
            ),
          ],
        );
      },
    );
  }

  Widget _buildProjectsHeader() {
    return Row(
      children: [
        // Projects Title
        const Row(
          children: [
            FaIcon(
              FontAwesomeIcons.list,
              size: 20,
              color: AppColors.textPrimary,
            ),
            SizedBox(width: AppConstants.paddingSmall),
            Text(
              'PROJECTS',
              style: TextStyle(
                fontSize: AppConstants.fontSizeLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),

        const SizedBox(width: AppConstants.paddingLarge),

        // Search Bar
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Looking for a specific project?',
                hintStyle: TextStyle(
                  fontSize: AppConstants.fontSizeMedium,
                  color: AppColors.grey,
                ),
                prefixIcon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 16,
                  color: AppColors.grey,
                ),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                  vertical: AppConstants.paddingSmall,
                ),
              ),
            ),
          ),
        ),

        const Spacer(),

        // Filter Dropdown
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium,
            vertical: AppConstants.paddingSmall,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          ),
          child: Row(
            children: [
              const Text(
                'filter by status',
                style: TextStyle(
                  fontSize: AppConstants.fontSizeMedium,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(width: AppConstants.paddingSmall),
              const FaIcon(
                FontAwesomeIcons.chevronDown,
                size: 12,
                color: AppColors.grey,
              ),
            ],
          ),
        ),

        const SizedBox(width: AppConstants.paddingMedium),

        // Add Project Button
        ElevatedButton.icon(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.plus, size: 14),
          label: const Text('ADD PROJECT'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingLarge,
              vertical: AppConstants.paddingMedium,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive grid columns
        int crossAxisCount = 2;
        if (constraints.maxWidth < 900) crossAxisCount = 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppConstants.paddingLarge,
            mainAxisSpacing: AppConstants.paddingLarge,
            childAspectRatio: 1.3,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return ProjectCardWidget(
              title: 'New City Hall Improvements',
              projectCode: 'ABC123EFG',
              contractor: 'ABCDEFG Construction',
              location: 'San Isidro City, Philippines',
              budgetSpent: '₱ 2,341,000',
              allocatedBudget: '₱ 10,000,000',
              dateRange: 'Aug 14, 2024 - Jan 14, 2024',
              description:
                  'The City Hall Improvement Project aims to modernize the San Isidro City Hall by upgrading its structural integrity, electrical and IT systems, and public service facilities. The project includes building rehabilitation, installation of solar panels, improved accessibility features, and enhanced security systems. Designed with a focus on sustainability and efficiency, the project seeks to enhance public service delivery and create a safer, more functional, and eco-friendly civic environment.',
              status: index % 2 == 0 ? 'CEO - Evaluation' : 'CEO - Evaluation',
              deadline: 'Due: 10/28/2025',
              imageUrl: 'https://via.placeholder.com/400x200',
            );
          },
        );
      },
    );
  }
}
