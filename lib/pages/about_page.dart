import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildStorySection(),
            _buildMissionVisionCards(),
            _buildNumbersSection(),
            _buildCoreValuesSection(),
            _buildTeamCultureSection(),
            _buildTimelineSection(),
            _buildWhyWorkWithUsSection(),
            _buildCallToAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.cyan.withOpacity(0.1),
            AppColors.white,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 60, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(),
              const SizedBox(height: 10),
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cyan.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: AppColors.cyan.withOpacity(0.3),
                              width: 1.5,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                size: 18,
                                color: AppColors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Our Story',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Building the\nFuture of Tech',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: AppColors.dark,
                            height: 1.1,
                            letterSpacing: -1,
                          ),
                        ),
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

  Widget _buildLogo() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(-50 * (1 - value), 0),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/logo.png',
                width: 304,
                height: 54,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStorySection() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                      height: 1.7,
                    ),
                    children: [
                      TextSpan(
                        text: 'Codeterna ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text:
                        'was born from a simple vision: to bridge the gap between ambitious businesses and cutting-edge technology. ',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'We believe every business deserves access to world-class digital solutions that drive real growth and innovation.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.grey,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMissionVisionCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildInfoCard(
            icon: Icons.flag_rounded,
            title: 'Mission',
            description:
            'Empower businesses with innovative technology solutions that transform ideas into digital success stories.',
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.primary.withOpacity(0.7),
              ],
            ),
            index: 0,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.remove_red_eye_rounded,
            title: 'Vision',
            description:
            'To be the most trusted technology partner, recognized globally for excellence, innovation, and client success.',
            gradient: LinearGradient(
              colors: [
                AppColors.cyan,
                AppColors.cyan.withOpacity(0.7),
              ],
            ),
            index: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required Gradient gradient,
    required int index,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 800 + (index * 200)),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(50 * (1 - value), 0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white.withOpacity(0.95),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNumbersSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.yellow.withOpacity(0.15),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.yellow.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Our Impact',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNumberItem('150+', 'Projects\nCompleted', 0),
              _buildNumberItem('80+', 'Happy\nClients', 1),
              _buildNumberItem('20+', 'Team\nMembers', 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberItem(String number, String label, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 1000 + (index * 200)),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value.clamp(0.0, 1.0),
          child: Column(
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCoreValuesSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Core Values',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'The principles that guide everything we do',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 24),
          _buildValueItem(Icons.lightbulb_outline, 'Innovation First',
              'Constantly pushing boundaries', AppColors.yellow, 0),
          _buildValueItem(Icons.handshake_outlined, 'Client Partnership',
              'Your success is our priority', AppColors.primary, 1),
          _buildValueItem(Icons.verified_outlined, 'Quality Excellence',
              'No compromise on standards', AppColors.cyan, 2),
          _buildValueItem(Icons.speed_rounded, 'Agile Delivery',
              'Fast, efficient, and reliable', AppColors.primary, 3),
        ],
      ),
    );
  }

  Widget _buildValueItem(
      IconData icon,
      String title,
      String subtitle,
      Color color,
      int index,
      ) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 600 + (index * 150)),
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(-30 * (1 - value), 0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: color.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(icon, color: color, size: 26),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.dark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTeamCultureSection() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary,
                  AppColors.cyan,
                ],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.groups_rounded,
                  size: 50,
                  color: AppColors.white,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Our Team Culture',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'We\'re more than colleagues—we\'re a family of innovators, problem-solvers, and dreamers working together to create exceptional digital experiences.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.white.withOpacity(0.95),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimelineSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Journey',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(height: 24),
          _buildTimelineItem('2020', 'The Beginning',
              'Founded with a vision to transform businesses', 0),
          _buildTimelineItem('2021', 'Rapid Growth',
              'Expanded to 50+ successful projects', 1),
          _buildTimelineItem(
              '2022', 'Team Expansion', 'Grew to 20+ talented professionals', 2),
          _buildTimelineItem('2023', 'Milestone Achieved',
              'Celebrated 100+ happy clients', 3),
          _buildTimelineItem('2024', 'Innovation Continues',
              'Leading the way in digital transformation', 4),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
      String year, String title, String description, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 700 + (index * 100)),
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.cyan.withOpacity(0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.cyan,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          year.substring(2),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cyan,
                          ),
                        ),
                      ),
                    ),
                    if (index < 4)
                      Container(
                        width: 2,
                        height: 50,
                        color: AppColors.cyan.withOpacity(0.3),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.dark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWhyWorkWithUsSection() {
    final reasons = [
      {'icon': Icons.star_rounded, 'text': 'Proven track record'},
      {'icon': Icons.speed_rounded, 'text': 'Fast & reliable delivery'},
      {'icon': Icons.support_agent_rounded, 'text': '24/7 dedicated support'},
      {'icon': Icons.shield_rounded, 'text': 'Enterprise-grade security'},
      {'icon': Icons.trending_up_rounded, 'text': 'Scalable solutions'},
      {'icon': Icons.palette_rounded, 'text': 'Custom-tailored design'},
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Why Partner With Us',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              reasons.length,
                  (index) => _buildReasonChip(
                reasons[index]['icon'] as IconData,
                reasons[index]['text'] as String,
                index,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReasonChip(IconData icon, String text, int index) {
    final colors = [
      AppColors.primary,
      AppColors.cyan,
      AppColors.yellow,
      AppColors.primary,
      AppColors.cyan,
      AppColors.yellow,
    ];

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 600 + (index * 100)),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value.clamp(0.0, 1.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colors[index].withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: colors[index].withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: colors[index], size: 20),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: colors[index],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCallToAction() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                const Text(
                  '🚀',
                  style: TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Let\'s Build Something Amazing',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Ready to transform your business with cutting-edge technology? Let\'s talk!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.white.withOpacity(0.8),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow,
                    foregroundColor: AppColors.dark,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Start Your Project',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}