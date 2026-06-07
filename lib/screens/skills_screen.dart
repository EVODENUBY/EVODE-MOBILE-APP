import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../data/portfolio_data.dart';
import '../models/skill_model.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = PortfolioData.skills;
    final categories = SkillCategory.values;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: categories.map((category) {
        final categorySkills = skills.where((s) => s.category == category).toList();
        if (categorySkills.isEmpty) return const SizedBox();

        return _SkillCategorySection(
          category: category,
          skills: categorySkills,
        );
      }).toList(),
    );
  }
}

class _SkillCategorySection extends StatelessWidget {
  final SkillCategory category;
  final List<Skill> skills;

  const _SkillCategorySection({
    required this.category,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16, top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: AppColors.gradient1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Text(
                category.emoji,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 12),
              Text(
                category.displayName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        ...skills.map((skill) => _SkillTile(skill: skill)),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _SkillTile extends StatelessWidget {
  final Skill skill;

  const _SkillTile({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  skill.name,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  '${skill.yearsOfExperience} yrs',
                  style: TextStyle(color: AppColors.textLightSecondary, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: skill.proficiency,
                minHeight: 10,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(
                  skill.proficiency >= 0.8
                      ? AppColors.success
                      : skill.proficiency >= 0.6
                      ? AppColors.warning
                      : AppColors.error,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${(skill.proficiency * 100).toInt()}%',
              style: TextStyle(
                fontSize: 12,
                color: skill.proficiency >= 0.8
                    ? AppColors.success
                    : skill.proficiency >= 0.6
                    ? AppColors.warning
                    : AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}