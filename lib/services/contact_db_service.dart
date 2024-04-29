import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/contact_info_model.dart';

const String TODO_COLLECTON_REF = "contact_information";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _contactRef;

  DatabaseService() {
    _contactRef =
        _firestore.collection(TODO_COLLECTON_REF).withConverter<ContactInfo>(
            fromFirestore: (snapshots, _) => ContactInfo.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (contact, _) => contact.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return _contactRef.snapshots();
  }

  void addTodo(ContactInfo contact) async {
    _contactRef.add(contact);
  }

  void updateTodo(String contactId, ContactInfo contact) {
    _contactRef.doc(contactId).update(contact.toJson());
  }

  void deleteTodo(String contactId) {
    _contactRef.doc(contactId).delete();
  }
}
