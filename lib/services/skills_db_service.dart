import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/career_model.dart';
import 'package:resume_builder_twinkle/models/skills_model.dart';

const String TODO_COLLECTON_REF = "skills";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _skillsRef;

  DatabaseService() {
    _skillsRef =
        _firestore.collection(TODO_COLLECTON_REF).withConverter<Skills>(
            fromFirestore: (snapshots, _) => Skills.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (skills, _) => skills.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return _skillsRef.snapshots();
  }

  void addTodo(Skills skills) async {
    _skillsRef.add(skills);
  }

  void updateTodo(String skillsId, Skills skills) {
    _skillsRef.doc(skillsId).update(skills.toJson());
  }

  void deleteTodo(String skillsId) {
    _skillsRef.doc(skillsId).delete();
  }
}
