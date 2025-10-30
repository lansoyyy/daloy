import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_text_styles.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 1024;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer:
          isMobile || isTablet ? Drawer(child: const SidebarWidget()) : null,
      body: Row(
        children: [
          // Sidebar - Only show on desktop
          if (isDesktop) const SidebarWidget(),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Top Bar
                _buildTopBar(isMobile, isTablet),

                // Main Content Area
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(isMobile
                        ? AppConstants.paddingMedium
                        : AppConstants.paddingLarge),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Breadcrumb - hide on mobile
                        if (!isMobile) _buildBreadcrumb(),
                        if (!isMobile)
                          const SizedBox(height: AppConstants.paddingLarge),

                        // Statistics Cards
                        _buildStatisticsCards(),

                        SizedBox(
                            height: isMobile
                                ? AppConstants.paddingLarge
                                : AppConstants.paddingExtraLarge),

                        // Projects Section Header
                        _buildProjectsHeader(isMobile, isTablet),

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

  Widget _buildTopBar(bool isMobile, bool isTablet) {
    final showMenuButton = isMobile || isTablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:
            isMobile ? AppConstants.paddingMedium : AppConstants.paddingLarge,
        vertical: AppConstants.paddingMedium,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Menu button for mobile/tablet
          if (showMenuButton) ...[
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const FaIcon(
                    FontAwesomeIcons.bars,
                    size: 20,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppConstants.paddingSmall),
          ],

          // App title on mobile
          if (isMobile) ...[
            Text(
              'Daloy',
              style: AppTextStyles.h5(color: AppColors.secondary),
            ),
          ],

          const Spacer(),

          // Notification Icon with badge
          Stack(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const FaIcon(
                      FontAwesomeIcons.bell,
                      size: 20,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          if (!isMobile) const SizedBox(width: AppConstants.paddingMedium),

          // User Profile - simplified on mobile
          if (isMobile)
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.primary,
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    size: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
            )
          else
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingMedium,
                    vertical: AppConstants.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey),
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusLarge),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.primary,
                        child: FaIcon(
                          FontAwesomeIcons.user,
                          size: 16,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: AppConstants.paddingSmall),
                      Text(
                        'John Doe',
                        style: AppTextStyles.subtitleMedium(),
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
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingSmall,
                vertical: 4,
              ),
              child: Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.house,
                    size: 14,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: AppConstants.paddingSmall),
                  Text(
                    'HOME',
                    style: AppTextStyles.overline(color: AppColors.primary),
                  ),
                ],
              ),
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

        return AnimatedContainer(
          duration: AppConstants.animationMedium,
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: AppConstants.paddingMedium,
            mainAxisSpacing: AppConstants.paddingMedium,
            childAspectRatio: 1.75,
            children: [
              TweenAnimationBuilder<double>(
                duration: AppConstants.animationMedium,
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: const StatCardWidget(
                  title: 'Total Projects',
                  value: '80',
                  subtitle: 'projects',
                  color: AppColors.primary,
                  icon: FontAwesomeIcons.folderOpen,
                ),
              ),
              TweenAnimationBuilder<double>(
                duration: AppConstants.animationMedium,
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: const StatCardWidget(
                  title: 'Active Projects',
                  value: '55',
                  subtitle: 'projects',
                  color: AppColors.secondary,
                  icon: FontAwesomeIcons.hammer,
                ),
              ),
              TweenAnimationBuilder<double>(
                duration: AppConstants.animationMedium,
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: const StatCardWidget(
                  title: 'Completed',
                  value: '20',
                  subtitle: 'projects',
                  color: AppColors.accent,
                  icon: FontAwesomeIcons.checkCircle,
                ),
              ),
              TweenAnimationBuilder<double>(
                duration: AppConstants.animationMedium,
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: const StatCardWidget(
                  title: 'Terminated',
                  value: '5',
                  subtitle: 'projects',
                  color: AppColors.error,
                  icon: FontAwesomeIcons.timesCircle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectsHeader(bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                ),
                child: const FaIcon(
                  FontAwesomeIcons.list,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppConstants.paddingSmall),
              Text(
                'PROJECTS',
                style: AppTextStyles.h6(),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingMedium),

          // Search Bar
          AnimatedContainer(
            duration: AppConstants.animationShort,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search projects...',
                hintStyle: AppTextStyles.bodySmall(color: AppColors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: const FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 16,
                    color: AppColors.grey,
                  ),
                ),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                  vertical: AppConstants.paddingSmall,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),

          // Action buttons row
          Row(
            children: [
              Expanded(
                child: Material(
                  elevation: 0,
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusMedium),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppConstants.paddingSmall,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightGrey),
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusMedium),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.filter,
                            size: 12,
                            color: AppColors.grey,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Filter',
                            style: AppTextStyles.buttonSmall(
                                color: AppColors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.paddingSmall),
              Expanded(
                child: Material(
                  elevation: 2,
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusMedium),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppConstants.paddingSmall,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusMedium),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.plus,
                            size: 12,
                            color: AppColors.white,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Add',
                            style: AppTextStyles.buttonSmall(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        // Projects Title
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              ),
              child: const FaIcon(
                FontAwesomeIcons.list,
                size: 18,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: AppConstants.paddingSmall),
            Text(
              'PROJECTS',
              style: AppTextStyles.h5(),
            ),
          ],
        ),

        const SizedBox(width: AppConstants.paddingLarge),

        // Search Bar
        Expanded(
          child: AnimatedContainer(
            duration: AppConstants.animationShort,
            constraints: const BoxConstraints(maxWidth: 400),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Looking for a specific project?',
                hintStyle: AppTextStyles.bodyMedium(color: AppColors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: const FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 16,
                    color: AppColors.grey,
                  ),
                ),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2),
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
        if (!isTablet)
          Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                  vertical: AppConstants.paddingSmall,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.lightGrey),
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                ),
                child: Row(
                  children: [
                    Text(
                      'filter by status',
                      style: AppTextStyles.bodyMedium(color: AppColors.grey),
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
            ),
          ),

        const SizedBox(width: AppConstants.paddingMedium),

        // Add Project Button
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet
                    ? AppConstants.paddingMedium
                    : AppConstants.paddingLarge,
                vertical: AppConstants.paddingMedium,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              ),
              child: Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.plus,
                    size: 14,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: AppConstants.paddingSmall),
                  Text(
                    isTablet ? 'ADD' : 'ADD PROJECT',
                    style: AppTextStyles.buttonMedium(),
                  ),
                ],
              ),
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

        return AnimatedContainer(
          duration: AppConstants.animationMedium,
          child: GridView.builder(
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
              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 300 + (index * 100)),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: Opacity(
                      opacity: value,
                      child: child,
                    ),
                  );
                },
                child: ProjectCardWidget(
                  title: 'New City Hall Improvements',
                  projectCode: 'ABC123EFG',
                  contractor: 'ABCDEFG Construction',
                  location: 'San Isidro City, Philippines',
                  budgetSpent: '₱ 2,341,000',
                  allocatedBudget: '₱ 10,000,000',
                  dateRange: 'Aug 14, 2024 - Jan 14, 2024',
                  description:
                      'The City Hall Improvement Project aims to modernize the San Isidro City Hall by upgrading its structural integrity, electrical and IT systems, and public service facilities. The project includes building rehabilitation, installation of solar panels, improved accessibility features, and enhanced security systems. Designed with a focus on sustainability and efficiency, the project seeks to enhance public service delivery and create a safer, more functional, and eco-friendly civic environment.',
                  status:
                      index % 2 == 0 ? 'CEO - Evaluation' : 'CEO - Evaluation',
                  deadline: 'Due: 10/28/2025',
                  imageUrl: 'https://via.placeholder.com/400x200',
                ),
              );
            },
          ),
        );
      },
    );
  }
}
