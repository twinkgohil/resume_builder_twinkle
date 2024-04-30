import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/models/contact_info_model.dart';
import 'package:resume_builder_twinkle/models/personal_statement_model.dart';
import 'package:resume_builder_twinkle/modules/resume/resume_controller.dart';
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
          const Divider(color: Colors.black,),
          personalStatementWidget(),
          const Divider(color: Colors.black,),
        ],
      ),
    );
  }

  Widget contactInfoWidget() {
    return Padding(
      padding:EdgeInsets.all(getSize(16)),
      child: SizedBox(
        // height: MediaQuery.sizeOf(context).height * 0.80,
        // width: MediaQuery.sizeOf(context).width,
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
                      ],
                    ));
              },
            );
          },
        ),
      ),
    );
  }

  Widget personalStatementWidget(){
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
                  ],
                ));
          },
        );
      },
    );
  }
}
