import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/personal_statement_model.dart';

const String COLLECTON_REF = "personal_statement";

class StatementDatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _statementRef;

  StatementDatabaseService() {
    _statementRef = _firestore
        .collection(COLLECTON_REF)
        .withConverter<PersonalStatement>(
            fromFirestore: (snapshots, _) => PersonalStatement.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (statement, _) => statement.toJson());
  }

  Stream<QuerySnapshot> getStatement() {
    return _statementRef.snapshots();
  }

  void add(PersonalStatement statement) async {
    _statementRef.add(statement);
  }

  void update(String statementId, PersonalStatement statement) {
    _statementRef.doc(statementId).update(statement.toJson());
  }

  void delete(String statementId) {
    _statementRef.doc(statementId).delete();
  }
}
