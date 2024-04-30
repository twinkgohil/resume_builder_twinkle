import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/career_model.dart';
import 'package:resume_builder_twinkle/models/skills_model.dart';

const String COLLECTON_REF = "skills";

class SkillsDatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _skillsRef;

  SkillsDatabaseService() {
    _skillsRef =
        _firestore.collection(COLLECTON_REF).withConverter<Skills>(
            fromFirestore: (snapshots, _) => Skills.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (skills, _) => skills.toJson());
  }

  Stream<QuerySnapshot> getSkillsData() {
    return _skillsRef.snapshots();
  }

  void add(Skills skills) async {
    _skillsRef.add(skills);
  }

  void update(String skillsId, Skills skills) {
    _skillsRef.doc(skillsId).update(skills.toJson());
  }

  void delete(String skillsId) {
    _skillsRef.doc(skillsId).delete();
  }
}
