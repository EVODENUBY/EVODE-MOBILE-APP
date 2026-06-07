import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/app_colors.dart';
import '../data/portfolio_data.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/typewriter_text.dart';
import 'projects_screen.dart';
import 'skills_screen.dart';
import 'experience_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    _AboutTab(),
    ProjectsScreen(),
    SkillsScreen(),
    ExperienceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evode M. Portfolio'),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: Icon(
                  themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () => themeProvider.toggleTheme(),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactScreen()),
          );
        },
        icon: const Icon(Icons.mail),
        label: const Text('Contact Me'),
        backgroundColor: AppColors.primary,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.person), label: 'About'),
          NavigationDestination(icon: Icon(Icons.code), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.psychology), label: 'Skills'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Experience'),
        ],
      ),
    );
  }
}

class _AboutTab extends StatelessWidget {
  const _AboutTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Profile Image
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: AppColors.gradient1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
          ),
          const SizedBox(height: 20),
          // Name
          Text(
            PortfolioData.name,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 10),
          // Title
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.gradient1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'Software Engineer',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20),
          // Bio
          TypewriterText(
            text: PortfolioData.bio,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
            speed: const Duration(milliseconds: 40),
          ),
          const SizedBox(height: 30),
          // Social Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(Icons.code, PortfolioData.github),
              const SizedBox(width: 15),
              _buildSocialButton(Icons.work, PortfolioData.linkedin),
              const SizedBox(width: 15),
              _buildSocialButton(Icons.alternate_email, PortfolioData.twitter),
              const SizedBox(width: 15),
              _buildSocialButton(Icons.email, 'mailto:${PortfolioData.email}'),
            ],
          ),
          const SizedBox(height: 30),
          // Quick Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard('3+', 'Years Exp', context),
              _buildStatCard('${PortfolioData.projects.length}+', 'Projects', context),
              _buildStatCard('${PortfolioData.skills.length}+', 'Skills', context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.primary, size: 24),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}