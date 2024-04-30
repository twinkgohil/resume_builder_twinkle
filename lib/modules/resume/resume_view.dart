import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/models/career_model.dart';
import 'package:resume_builder_twinkle/models/contact_info_model.dart';
import 'package:resume_builder_twinkle/models/education_model.dart';
import 'package:resume_builder_twinkle/models/personal_statement_model.dart';
import 'package:resume_builder_twinkle/models/skills_model.dart';
import 'package:resume_builder_twinkle/modules/career/career_binding.dart';
import 'package:resume_builder_twinkle/modules/career/career_view.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_binding.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_view.dart';
import 'package:resume_builder_twinkle/modules/education/education_binding.dart';
import 'package:resume_builder_twinkle/modules/education/education_view.dart';
import 'package:resume_builder_twinkle/modules/personal_statement/statement_binding.dart';
import 'package:resume_builder_twinkle/modules/personal_statement/statement_view.dart';
import 'package:resume_builder_twinkle/modules/resume/resume_controller.dart';
import 'package:resume_builder_twinkle/modules/resume/widget/update_delete_button.dart';
import 'package:resume_builder_twinkle/modules/skills/skills_binding.dart';
import 'package:resume_builder_twinkle/modules/skills/skills_view.dart';
import 'package:resume_builder_twinkle/utiils/math.dart';

class ResumeView extends GetView<ResumeController> {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Resume View"),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          contactInfoWidget(),
          const Divider(
            color: Colors.black,
          ),
          personalStatementWidget(),
          const Divider(
            color: Colors.black,
          ),
          careerWidget(),
          const Divider(
            color: Colors.black,
          ),
          educationWidget(),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget contactInfoWidget() {
    return Padding(
      padding: EdgeInsets.all(getSize(16)),
      child: SizedBox(
        child: StreamBuilder(
          stream: controller.contactDatabaseService.getContactData(),
          builder: (context, snapshot) {
            List contactData = snapshot.data?.docs ?? [];
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contactData.length,
              itemBuilder: (context, index) {
                ContactInfo contactInfo = contactData[index].data();
                String contactId = contactData[index].id;
                return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        BaseText(
                          text: contactInfo.name.toUpperCase(),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: getSize(10),
                        ),
                        BaseText(
                          text:
                              '${contactInfo.email} | ${contactInfo.mobileNumber}',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: getSize(5),
                        ),
                        UpdateDeleteButton(
                          updateOnPress: () {
                            Get.to(const ContactInfoView(),
                                binding: ContactInfoBinding(),
                                arguments: [contactId]);
                          },
                          deleteOnPress: () {
                            controller.contactDatabaseService.delete(contactId);
                          },
                        )
                      ],
                    ));
              },
            );
          },
        ),
      ),
    );
  }

  Widget personalStatementWidget() {
    return StreamBuilder(
      stream: controller.statementDatabaseService.getStatement(),
      builder: (context, snapshot) {
        List statementData = snapshot.data?.docs ?? [];
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: statementData.length,
          itemBuilder: (context, index) {
            PersonalStatement statements = statementData[index].data();
            String statementId = statementData[index].id;
            return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    BaseText(
                      text: statements.statement.toUpperCase(),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    UpdateDeleteButton(
                      updateOnPress: () {
                        Get.to(const StatementView(),
                            binding: StatementBinding(),
                            arguments: [statementId]);
                      },
                      deleteOnPress: () {
                        controller.statementDatabaseService.delete(statementId);
                      },
                    )
                  ],
                ));
          },
        );
      },
    );
  }

  Widget careerWidget() {
    return StreamBuilder(
      stream: controller.careerDatabaseService.getCareerData(),
      builder: (context, snapshot) {
        List careerData = snapshot.data?.docs ?? [];
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: careerData.length,
          itemBuilder: (context, index) {
            Career career = careerData[index].data();
            String careerId = careerData[index].id;
            return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    BaseText(
                      text: "Career".toUpperCase(),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        BaseText(
                          text: career.companyName.toUpperCase(),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: BaseText(
                            text:
                                '${DateFormat('dd-MM-yyyy').format(career.startDate.toDate())}-${DateFormat('dd-MM-yyyy').format(career.endDate.toDate())}',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    BaseText(
                      text: career.jobTitle.toUpperCase(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                    ),
                    BaseText(
                      text: career.skills.toUpperCase(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                    ),
                    UpdateDeleteButton(
                      updateOnPress: () {
                        Get.to(const CareerView(),
                            binding: CareerBinding(), arguments: [careerId]);
                      },
                      deleteOnPress: () {
                        controller.careerDatabaseService.delete(careerId);
                      },
                    )
                  ],
                ));
          },
        );
      },
    );
  }

  Widget educationWidget() {
    return StreamBuilder(
      stream: controller.educationDatabaseService.getEducationData(),
      builder: (context, snapshot) {
        List educationData = snapshot.data?.docs ?? [];
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: educationData.length,
          itemBuilder: (context, index) {
            Education education = educationData[index].data();
            String educationId = educationData[index].id;
            return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    BaseText(
                      text: "Education".toUpperCase(),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        BaseText(
                          text: education.universityName.toUpperCase(),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: BaseText(
                            text:
                                '${DateFormat('dd-MM-yyyy').format(education.startDate.toDate())}-${DateFormat('dd-MM-yyyy').format(education.endDate.toDate())}',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    BaseText(
                      text: education.qualification.toUpperCase(),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                    ),
                    UpdateDeleteButton(
                      updateOnPress: () {
                        Get.to(const EducationView(),
                            binding: EducationBinding(),
                            arguments: [educationId]);
                      },
                      deleteOnPress: () {
                        controller.educationDatabaseService.delete(educationId);
                      },
                    )
                  ],
                ));
          },
        );
      },
    );
  }

  Widget skillsWidget() {
    return StreamBuilder(
      stream: controller.skillsDatabaseService.getSkillsData(),
      builder: (context, snapshot) {
        List skillsData = snapshot.data?.docs ?? [];
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: skillsData.length,
          itemBuilder: (context, index) {
            Skills skill = skillsData[index].data();
            String skillsId = skillsData[index].id;
            return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    BaseText(
                      text: "Skills".toUpperCase(),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    BaseText(
                      text: skill.skills.toUpperCase(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    UpdateDeleteButton(
                      updateOnPress: () {
                        Get.to(const SkillsView(),
                            binding: SkillsBinding(), arguments: [skillsData]);
                      },
                      deleteOnPress: () {
                        controller.skillsDatabaseService.delete(skillsId);
                      },
                    )
                  ],
                ));
          },
        );
      },
    );
  }
}
