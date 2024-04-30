import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/career_model.dart';

const String COLLECTON_REF = "career";

class CareerDatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _careerRef;

  CareerDatabaseService() {
    _careerRef =
        _firestore.collection(COLLECTON_REF).withConverter<Career>(
            fromFirestore: (snapshots, _) => Career.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (career, _) => career.toJson());
  }

  Stream<QuerySnapshot> getCareerData() {
    return _careerRef.snapshots();
  }

  void add(Career careerDetail) async {
    _careerRef.add(careerDetail);
  }

  void update(String careerId, Career careerDetail) {
    _careerRef.doc(careerId).update(careerDetail.toJson());
  }

  void delete(String careerId) {
    _careerRef.doc(careerId).delete();
  }
}
