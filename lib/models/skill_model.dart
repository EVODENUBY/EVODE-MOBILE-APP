class Skill {
  final String name;
  final double proficiency;
  final SkillCategory category;
  final int yearsOfExperience;

  const Skill({
    required this.name,
    required this.proficiency,
    required this.category,
    required this.yearsOfExperience,
  });
}

enum SkillCategory {
  languages,
  frameworks,
  tools,
  databases,
  cloud,
}

extension SkillCategoryExtension on SkillCategory {
  String get displayName {
    switch (this) {
      case SkillCategory.languages: return 'Languages';
      case SkillCategory.frameworks: return 'Frameworks';
      case SkillCategory.tools: return 'Tools';
      case SkillCategory.databases: return 'Databases';
      case SkillCategory.cloud: return 'Cloud & DevOps';
    }
  }

  String get emoji {
    switch (this) {
      case SkillCategory.languages: return '💻';
      case SkillCategory.frameworks: return '🔧';
      case SkillCategory.tools: return '🛠️';
      case SkillCategory.databases: return '🗄️';
      case SkillCategory.cloud: return '☁️';
    }
  }
}