import 'package:flutter_modular/flutter_modular.dart';
import 'package:hackathon_austria/module/home/presenter/screens/community/community_screen.dart';
import 'package:hackathon_austria/module/home/presenter/screens/course/course_screen.dart';
import 'package:hackathon_austria/module/home/presenter/screens/diagnostic/diagnostic_screen.dart';
import 'package:hackathon_austria/module/home/presenter/screens/jobs/jobs_screen.dart';

class HomeModule extends Module {

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (context, args) => const CourseScreen()),
    ChildRoute('/courses', child: (context, args) => const CourseScreen()),
    ChildRoute('/community', child: (context, args) => const CommunityScreen()),
    ChildRoute('/jobs', child: (context, args) => const JobsScreen()),
    ChildRoute('/diagnostic', child: (context, args) => const DiagnosticScreen()),
  ];
}