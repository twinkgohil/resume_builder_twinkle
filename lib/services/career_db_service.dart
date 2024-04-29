import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/career_model.dart';

const String TODO_COLLECTON_REF = "career";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _careerRef;

  DatabaseService() {
    _careerRef =
        _firestore.collection(TODO_COLLECTON_REF).withConverter<Career>(
            fromFirestore: (snapshots, _) => Career.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (career, _) => career.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return _careerRef.snapshots();
  }

  void addTodo(Career careerDetail) async {
    _careerRef.add(careerDetail);
  }

  void updateTodo(String careerId, Career careerDetail) {
    _careerRef.doc(careerId).update(careerDetail.toJson());
  }

  void deleteTodo(String careerId) {
    _careerRef.doc(careerId).delete();
  }
}
