import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/education_model.dart';

const String TODO_COLLECTON_REF = "education";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _educationRef;

  DatabaseService() {
    _educationRef =
        _firestore.collection(TODO_COLLECTON_REF).withConverter<Education>(
            fromFirestore: (snapshots, _) => Education.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (education, _) => education.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return _educationRef.snapshots();
  }

  void addTodo(Education education) async {
    _educationRef.add(education);
  }

  void updateTodo(String educationId, Education education) {
    _educationRef.doc(educationId).update(education.toJson());
  }

  void deleteTodo(String educationId) {
    _educationRef.doc(educationId).delete();
  }
}
