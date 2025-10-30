import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_text_styles.dart';
import '../widgets/sidebar_widget.dart';

class ProjectDetailScreen extends StatefulWidget {
  final String projectId;
  final String title;
  final String projectCode;
  final String contractor;
  final String location;
  final String budgetSpent;
  final String allocatedBudget;
  final String dateRange;
  final String description;
  final String imageUrl;

  const ProjectDetailScreen({
    super.key,
    required this.projectId,
    required this.title,
    required this.projectCode,
    required this.contractor,
    required this.location,
    required this.budgetSpent,
    required this.allocatedBudget,
    required this.dateRange,
    required this.description,
    required this.imageUrl,
  });

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          if (isDesktop) const SidebarWidget(),
          Expanded(
            child: Column(
              children: [
                _buildTopBar(isMobile, isTablet),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(
                      isMobile
                          ? AppConstants.paddingMedium
                          : AppConstants.paddingLarge,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBreadcrumb(),
                        const SizedBox(height: AppConstants.paddingLarge),
                        _buildProjectHeader(isMobile),
                        const SizedBox(height: AppConstants.paddingLarge),
                        _buildStatusTimeline(isMobile),
                        const SizedBox(height: AppConstants.paddingLarge),
                        _buildTabSection(isMobile),
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
            onTap: () => Navigator.pop(context),
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingSmall),
          child: FaIcon(
            FontAwesomeIcons.chevronRight,
            size: 10,
            color: AppColors.grey,
          ),
        ),
        Flexible(
          child: Text(
            'Project - ${widget.title}',
            style: AppTextStyles.overline(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildProjectHeader(bool isMobile) {
    return AnimatedContainer(
      duration: AppConstants.animationMedium,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        child: Container(
          padding: EdgeInsets.all(
            isMobile ? AppConstants.paddingMedium : AppConstants.paddingLarge,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProjectImage(isMobile),
                    const SizedBox(height: AppConstants.paddingMedium),
                    _buildProjectInfo(isMobile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildProjectImage(isMobile),
                    ),
                    const SizedBox(width: AppConstants.paddingLarge),
                    Expanded(
                      flex: 3,
                      child: _buildProjectInfo(isMobile),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildProjectImage(bool isMobile) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Container(
          height: isMobile ? 200 : 250,
          width: double.infinity,
          color: AppColors.lightGrey,
          child: Stack(
            children: [
              Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.image,
                        size: isMobile ? 40 : 48,
                        color: AppColors.grey,
                      ),
                    ),
                  );
                },
              ),
              // Gradient overlay for better visual appeal
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusMedium),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectInfo(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: isMobile ? AppTextStyles.h6() : AppTextStyles.h5(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: AppConstants.paddingSmall),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: AppConstants.paddingSmall,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'CEO - Evaluation',
                style: AppTextStyles.labelSmall(color: AppColors.white),
              ),
            ),
            const SizedBox(width: AppConstants.paddingSmall),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: AppConstants.paddingSmall,
              ),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.error.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Due: 10/26/2025',
                style: AppTextStyles.labelSmall(color: AppColors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.paddingMedium),
        _buildInfoRow('Project Timeline:', widget.dateRange, isMobile),
        _buildInfoRow('Project Code:', widget.projectCode, isMobile),
        _buildInfoRow('Allocated Budget:', widget.allocatedBudget, isMobile),
        _buildInfoRow('Location:', widget.location, isMobile),
        _buildInfoRow('Budget Spent:', widget.budgetSpent, isMobile),
        const SizedBox(height: AppConstants.paddingMedium),
        Text(
          'Description:',
          style: AppTextStyles.subtitleSmall(),
        ),
        const SizedBox(height: 6),
        Text(
          widget.description,
          style: AppTextStyles.bodySmall(color: AppColors.textSecondary),
          maxLines: isMobile ? 4 : 6,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: isMobile ? 120 : 140,
            child: Text(
              label,
              style: AppTextStyles.labelMedium(),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodySmall(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTimeline(bool isMobile) {
    return AnimatedContainer(
      duration: AppConstants.animationMedium,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        child: Container(
          padding: EdgeInsets.all(
            isMobile ? AppConstants.paddingMedium : AppConstants.paddingLarge,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusSmall),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.timeline,
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingSmall),
                  Text(
                    'Project Status Timeline',
                    style: isMobile ? AppTextStyles.h6() : AppTextStyles.h5(),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.paddingLarge),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
                      child: _buildTimelineItem(
                          'Proposal', 'Due: October 26, 2025', true, false),
                    ),
                    TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 400),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: _buildTimelineItem('CEO - Evaluation',
                          'Due: October 26, 2025', true, false),
                    ),
                    TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 500),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: _buildTimelineItem('Accounting - Inspection',
                          'Due: October 26, 2025', false, false),
                    ),
                    TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 600),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: _buildTimelineItem('CEO - Signing',
                          'Due: October 26, 2025', false, false),
                    ),
                    TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 700),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child:
                          _buildTimelineItem('GMO - Signing', '', false, true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
      String title, String date, bool isCompleted, bool isLast) {
    return Row(
      children: [
        Column(
          children: [
            Material(
              elevation: isCompleted ? 4 : 1,
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                  vertical: AppConstants.paddingSmall,
                ),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppColors.secondary
                      : AppColors.error.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                  boxShadow: [
                    if (isCompleted)
                      BoxShadow(
                        color: AppColors.secondary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.labelSmall(color: AppColors.white),
                      textAlign: TextAlign.center,
                    ),
                    if (date.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        date,
                        style: AppTextStyles.overline(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (isCompleted)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusSmall),
                  ),
                  child: Text(
                    'completed',
                    style: AppTextStyles.overline(color: AppColors.secondary),
                  ),
                ),
              ),
          ],
        ),
        if (!isLast)
          AnimatedContainer(
            duration: AppConstants.animationShort,
            width: 40,
            height: 2,
            decoration: BoxDecoration(
              color: isCompleted ? AppColors.secondary : AppColors.lightGrey,
              borderRadius: BorderRadius.circular(1),
              boxShadow: [
                if (isCompleted)
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
      ],
    );
  }

  Widget _buildTabSection(bool isMobile) {
    return AnimatedContainer(
      duration: AppConstants.animationMedium,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: AppColors.lightGrey.withOpacity(0.5), width: 1),
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.grey,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: AppTextStyles.buttonMedium(),
                  unselectedLabelStyle:
                      AppTextStyles.buttonMedium(color: AppColors.grey),
                  tabs: const [
                    Tab(
                      icon: FaIcon(FontAwesomeIcons.fileLines, size: 16),
                      text: 'Project Logs',
                      iconMargin: EdgeInsets.only(bottom: 4),
                    ),
                    Tab(
                      icon: FaIcon(FontAwesomeIcons.chartPie, size: 16),
                      text: 'Project Breakdown',
                      iconMargin: EdgeInsets.only(bottom: 4),
                    ),
                    Tab(
                      icon: FaIcon(FontAwesomeIcons.folder, size: 16),
                      text: 'Files & Reports',
                      iconMargin: EdgeInsets.only(bottom: 4),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 600,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildProjectLogsTab(isMobile),
                    _buildProjectBreakdownTab(),
                    _buildFilesReportsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectLogsTab(bool isMobile) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            isMobile ? AppConstants.paddingMedium : AppConstants.paddingLarge,
          ),
          child: Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: AppConstants.animationShort,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Looking for a specific log?',
                      hintStyle: AppTextStyles.bodySmall(color: AppColors.grey),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: const FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 14,
                          color: AppColors.grey,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.background,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusMedium),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusMedium),
                        borderSide: BorderSide(
                            color: AppColors.lightGrey.withOpacity(0.5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusMedium),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingMedium,
                        vertical: AppConstants.paddingSmall,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.paddingMedium),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingLarge,
                      vertical: AppConstants.paddingMedium,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusMedium),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.plus,
                          size: 12,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'ADD LOG',
                          style: AppTextStyles.buttonSmall(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: _buildLogsTable(isMobile),
          ),
        ),
      ],
    );
  }

  Widget _buildLogsTable(bool isMobile) {
    final logs = [
      {
        'code': 'ABC123',
        'from': 'Vir John',
        'to': 'K. Oliero',
        'remarks': 'For Remarks',
        'received': 'Received\n9/10/25 9:00 am'
      },
      {
        'code': 'ABC123',
        'from': 'KYO',
        'to': 'JCG',
        'remarks': 'For Signature',
        'received': 'Received\n9/9/25 8:42 am'
      },
      {
        'code': 'ABC123',
        'from': 'JCG',
        'to': 'KYO',
        'remarks': 'SPLL & & A not coincide with the back-up computation',
        'received': 'Received\n9/9/25 11:00 am'
      },
      {
        'code': 'ABC123',
        'from': 'KYO',
        'to': 'Contractor',
        'remarks': 'SWA for Signature',
        'received': 'Received\n9/9/25 11:12 am'
      },
      {
        'code': 'ABC123',
        'from': 'KYO',
        'to': 'ATBC',
        'remarks': 'completed',
        'received': 'Received\n9/9/25 10:10 pm'
      },
    ];

    return AnimatedContainer(
      duration: AppConstants.animationMedium,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(
          isMobile ? AppConstants.paddingMedium : AppConstants.paddingLarge,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.lightGrey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(
              AppColors.background,
            ),
            dataRowColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.primary.withOpacity(0.1);
              }
              if (states.contains(MaterialState.hovered)) {
                return AppColors.grey.withOpacity(0.1);
              }
              return AppColors.white;
            }),
            columns: [
              DataColumn(
                label: Text(
                  'CODE',
                  style: AppTextStyles.labelMedium(),
                ),
              ),
              DataColumn(
                label: Text(
                  'From',
                  style: AppTextStyles.labelMedium(),
                ),
              ),
              DataColumn(
                label: Text(
                  'To',
                  style: AppTextStyles.labelMedium(),
                ),
              ),
              DataColumn(
                label: Text(
                  'Remarks/Instructions',
                  style: AppTextStyles.labelMedium(),
                ),
              ),
              DataColumn(
                label: Text(
                  'Received',
                  style: AppTextStyles.labelMedium(),
                ),
              ),
              DataColumn(
                label: Text(
                  'Actions',
                  style: AppTextStyles.labelMedium(),
                ),
              ),
            ],
            rows: logs.asMap().entries.map((entry) {
              final index = entry.key;
              final log = entry.value;
              return DataRow(
                color: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.primary.withOpacity(0.1);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return AppColors.grey.withOpacity(0.1);
                  }
                  return AppColors.white;
                }),
                cells: [
                  DataCell(
                    Text(
                      log['code']!,
                      style: AppTextStyles.bodySmall(),
                    ),
                  ),
                  DataCell(
                    Text(
                      log['from']!,
                      style: AppTextStyles.bodySmall(),
                    ),
                  ),
                  DataCell(
                    Text(
                      log['to']!,
                      style: AppTextStyles.bodySmall(),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: isMobile ? 200 : 300,
                      child: Text(
                        log['remarks']!,
                        style: AppTextStyles.bodySmall(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      log['received']!,
                      style: AppTextStyles.bodyExtraSmall(),
                    ),
                  ),
                  DataCell(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                BorderRadius.circular(AppConstants.radiusSmall),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              child: const FaIcon(
                                FontAwesomeIcons.eye,
                                size: 14,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                BorderRadius.circular(AppConstants.radiusSmall),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              child: const FaIcon(
                                FontAwesomeIcons.penToSquare,
                                size: 14,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectBreakdownTab() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              ),
              child: const FaIcon(
                FontAwesomeIcons.chartPie,
                size: 64,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              'Project Breakdown',
              style: AppTextStyles.h4(),
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            Text(
              'Detailed project breakdown and analytics will be displayed here',
              style: AppTextStyles.bodyMedium(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilesReportsTab() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              ),
              child: const FaIcon(
                FontAwesomeIcons.folder,
                size: 64,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              'Files & Reports',
              style: AppTextStyles.h4(),
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            Text(
              'Project documents, reports, and file management will be displayed here',
              style: AppTextStyles.bodyMedium(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
