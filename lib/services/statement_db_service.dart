import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/personal_statement_model.dart';

const String TODO_COLLECTON_REF = "personal_statement";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _statementRef;

  DatabaseService() {
    _statementRef = _firestore
        .collection(TODO_COLLECTON_REF)
        .withConverter<PersonalStatement>(
            fromFirestore: (snapshots, _) => PersonalStatement.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (statement, _) => statement.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return _statementRef.snapshots();
  }

  void addTodo(PersonalStatement statement) async {
    _statementRef.add(statement);
  }

  void updateTodo(String statementId, PersonalStatement statement) {
    _statementRef.doc(statementId).update(statement.toJson());
  }

  void deleteTodo(String statementId) {
    _statementRef.doc(statementId).delete();
  }
}
