import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:resume_builder_twinkle/services/career_db_service.dart';
import 'package:resume_builder_twinkle/services/contact_db_service.dart';
import 'package:resume_builder_twinkle/services/education_db_service.dart';
import 'package:resume_builder_twinkle/services/skills_db_service.dart';
import 'package:resume_builder_twinkle/services/statement_db_service.dart';

class ResumeController extends GetxController {

  CareerDatabaseService careerDatabaseService = CareerDatabaseService();
  ContactDatabaseService contactDatabaseService = ContactDatabaseService();
  StatementDatabaseService statementDatabaseService = StatementDatabaseService();
  EducationDatabaseService educationDatabaseService = EducationDatabaseService();
  SkillsDatabaseService skillsDatabaseService = SkillsDatabaseService();


}