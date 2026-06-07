import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../data/portfolio_data.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = PortfolioData.experiences;
    final education = PortfolioData.education;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Work Experience',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...experiences.asMap().entries.map((entry) {
          final index = entry.key;
          final exp = entry.value;
          return _ExperienceTile(
            company: exp['company'] ?? '',
            role: exp['role'] ?? '',
            period: exp['period'] ?? '',
            description: exp['description'] ?? '',
            achievements: List<String>.from(exp['achievements'] ?? []),
            technologies: List<String>.from(exp['technologies'] ?? []),
            isLast: index == experiences.length - 1,
          );
        }),

        const SizedBox(height: 32),

        const Text(
          'Education',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...education.map((edu) => _EducationTile(
          degree: edu['degree'] ?? '',
          school: edu['school'] ?? '',
          year: edu['year'] ?? '',
          gpa: edu['gpa'] ?? '',
        )),
      ],
    );
  }
}

class _ExperienceTile extends StatelessWidget {
  final String company;
  final String role;
  final String period;
  final String description;
  final List<String> achievements;
  final List<String> technologies;
  final bool isLast;

  const _ExperienceTile({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.achievements,
    required this.technologies,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 40,
          child: Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(colors: AppColors.gradient1),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 200,
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
            ],
          ),
        ),
        Expanded(
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          role,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          period,
                          style: const TextStyle(fontSize: 12, color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(description, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 16),
                  ...achievements.map((achievement) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.star, color: AppColors.warning, size: 18),
                        const SizedBox(width: 8),
                        Expanded(child: Text(achievement)),
                      ],
                    ),
                  )),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: technologies.map((tech) => Chip(
                      label: Text(tech, style: const TextStyle(fontSize: 11)),
                      backgroundColor: AppColors.secondary.withValues(alpha: 0.1),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EducationTile extends StatelessWidget {
  final String degree;
  final String school;
  final String year;
  final String gpa;

  const _EducationTile({
    required this.degree,
    required this.school,
    required this.year,
    required this.gpa,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.school, color: AppColors.primary),
        ),
        title: Text(degree, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(school),
            Text('$year • GPA: $gpa', style: TextStyle(color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}