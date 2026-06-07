class Project {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String? imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final ProjectCategory category;
  final String duration;

  const Project({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.technologies,
    this.features = const [],
    this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    required this.category,
    required this.duration,
  });
}

enum ProjectCategory {
  mobile,
  web,
  backend,
  fullStack,
  devOps,
  machineLearning,
}

extension ProjectCategoryExtension on ProjectCategory {
  String get displayName {
    switch (this) {
      case ProjectCategory.mobile: return 'Mobile';
      case ProjectCategory.web: return 'Web';
      case ProjectCategory.backend: return 'Backend';
      case ProjectCategory.fullStack: return 'Full Stack';
      case ProjectCategory.devOps: return 'DevOps';
      case ProjectCategory.machineLearning: return 'ML/AI';
    }
  }

  String get icon {
    switch (this) {
      case ProjectCategory.mobile: return '📱';
      case ProjectCategory.web: return '🌐';
      case ProjectCategory.backend: return '⚙️';
      case ProjectCategory.fullStack: return '🚀';
      case ProjectCategory.devOps: return '🛠️';
      case ProjectCategory.machineLearning: return '🤖';
    }
  }
}