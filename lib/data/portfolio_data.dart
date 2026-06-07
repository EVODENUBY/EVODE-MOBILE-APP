import '../models/project_model.dart';
import '../models/skill_model.dart';

class PortfolioData {
  // PROFILE INFO
  static const String name = "EVODE MUYISINGIZEMWESE";
  static const String title = "Software Engineer";
  static const String tagline = "Turning Ideas into Scalable Solutions";
  static const String bio = """
  Passionate Software Engineer with experience building scalable applications. 
  Proficient in mobile development, cloud architecture, and creating efficient, 
  maintainable code. Open source enthusiast and continuous learner.
  """;

  static const String email = "evodemuyisingize@gmail.com";
  static const String phone = "+250 791 783 308";
  static const String location = "KIGALI, Rwanda";
  static const String github = "https://github.com/evodenuby";
  static const String linkedin = "https://linkedin.com/in/evode-muyisingizemwese";
  static const String twitter = "https://twitter.com/evodeSTACK";
  static const String website = "https://evodenuby.vercel.app";

  // EXPERIENCE
  static const List<Map<String, dynamic>> experiences = [
    {
      'company': 'Tech Corp',
      'role': 'Senior Software Engineer',
      'period': 'Jan 2022 - Present',
      'description': 'Leading mobile development team for flagship products.',
      'achievements': [
        'Developed Flutter apps with 100K+ downloads',
        'Reduced crash rate by 95%',
        'Led migration to microservices architecture',
      ],
      'technologies': ['Flutter', 'Dart', 'AWS', 'Docker'],
    },
    {
      'company': 'StartupXYZ',
      'role': 'Software Developer',
      'period': 'Jun 2020 - Dec 2021',
      'description': 'Built and maintained full-stack web applications.',
      'achievements': [
        'Built RESTful APIs serving 1M+ requests/day',
        'Optimized database queries by 40%',
        'Mentored junior developers',
      ],
      'technologies': ['React', 'Node.js', 'PostgreSQL', 'Redis'],
    },
  ];

  // EDUCATION
  static const List<Map<String, String>> education = [
    {
      'degree': 'B.S. Computer Science',
      'school': 'University of Technology',
      'year': '2016 - 2020',
      'gpa': '3.8/4.0',
    },
  ];

  // PROJECTS
  static final List<Project> projects = [
    Project(
      id: '1',
      title: 'E-Commerce App',
      subtitle: 'Full-featured shopping platform',
      description: 'Complete e-commerce solution with product catalog, cart, payments, and order tracking.',
      technologies: ['Flutter', 'Node.js', 'MongoDB', 'Stripe'],
      features: [
        'Product search and filters',
        'Secure payments via Stripe',
        'Real-time order tracking',
        'Push notifications',
      ],
      githubUrl: 'https://github.com/johndoe/ecommerce-app',
      category: ProjectCategory.mobile,
      duration: '3 months',
    ),
    Project(
      id: '2',
      title: 'Task Manager API',
      subtitle: 'Scalable backend service',
      description: 'RESTful API for task management with team collaboration and real-time updates.',
      technologies: ['Node.js', 'Express', 'PostgreSQL', 'Redis', 'Docker'],
      features: [
        'Real-time WebSocket updates',
        'Role-based access control',
        'Advanced search and filtering',
      ],
      githubUrl: 'https://github.com/johndoe/task-api',
      category: ProjectCategory.backend,
      duration: '2 months',
    ),
    Project(
      id: '3',
      title: 'Weather Dashboard',
      subtitle: 'Real-time weather monitoring',
      description: 'Interactive dashboard showing weather data with beautiful visualizations.',
      technologies: ['React', 'TypeScript', 'Chart.js', 'OpenWeather API'],
      features: [
        '5-day forecast',
        'Interactive maps',
        'Weather alerts',
      ],
      liveUrl: 'https://weather-dashboard-demo.web.app',
      category: ProjectCategory.web,
      duration: '1 month',
    ),
  ];

  // SKILLS
  static final List<Skill> skills = [
    const Skill(name: 'Flutter/Dart', proficiency: 0.90, category: SkillCategory.languages, yearsOfExperience: 3),
    const Skill(name: 'JavaScript/TypeScript', proficiency: 0.85, category: SkillCategory.languages, yearsOfExperience: 4),
    const Skill(name: 'Python', proficiency: 0.75, category: SkillCategory.languages, yearsOfExperience: 3),
    const Skill(name: 'React', proficiency: 0.85, category: SkillCategory.frameworks, yearsOfExperience: 3),
    const Skill(name: 'Node.js', proficiency: 0.80, category: SkillCategory.frameworks, yearsOfExperience: 3),
    const Skill(name: 'Docker', proficiency: 0.70, category: SkillCategory.tools, yearsOfExperience: 2),
    const Skill(name: 'Git', proficiency: 0.90, category: SkillCategory.tools, yearsOfExperience: 5),
    const Skill(name: 'PostgreSQL', proficiency: 0.80, category: SkillCategory.databases, yearsOfExperience: 3),
    const Skill(name: 'MongoDB', proficiency: 0.75, category: SkillCategory.databases, yearsOfExperience: 2),
    const Skill(name: 'AWS', proficiency: 0.70, category: SkillCategory.cloud, yearsOfExperience: 2),
  ];
}