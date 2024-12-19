import 'package:flutter/material.dart';

class MenageController {
  String? selectedlieuIdentification;
  String? selectedetat;
  String? selectedNiveauEtude;
  String? selectedProfession;
  String? selectedTypeVisa;
  String? selectedTypePiece;
  String selectedType = "";
  final List<String> niveauEtudeList = [
    'Non scolarisé',
    'École primaire',
    'Collège (BEPC)',
    'Lycée (Baccalauréat)',
    'Diplôme de technicien (DTS)',
    'Licence (Bac+3)',
    'Master (Bac+5)',
    'Doctorat (Bac+8)',
    'Formation professionnelle',
    'BTS/DUT',
    'Validation des acquis (VAE)',
  ];
  final Map<String, int> niveauEtudeListMap = {
    'Non scolarisé': 0,
    'École primaire': 1,
    'Collège (BEPC)': 2,
    'Lycée (Baccalauréat)': 3,
    'Diplôme de technicien (DTS)': 4,
    'Licence (Bac+3)': 5,
    'Master (Bac+5)': 6,
    'Doctorat (Bac+8)': 7,
    'Formation professionnelle': 8,
    'BTS/DUT': 9,
    'Validation des acquis (VAE)': 10,
  };
  final List<String> professionList = [
    'Médecin',
    'Infirmier/Infirmière',
    'Développeur/Développeuse',
    'Enseignant(e)',
    'Architecte',
    'Comptable',
    'Chauffeur',
    'Photographe',
    'Policier/Policière',
    'Agriculteur/Agricultrice',
    'Avocat/Avocate',
    'Mécanicien',
    'Musicien/Musicienne',
  ];
  final Map<String, int> professionListMap = {
    'Médecin': 0,
    'Infirmier/Infirmière': 1,
    'Développeur/Développeuse': 2,
    'Enseignant(e)': 3,
    'Architecte': 4,
    'Comptable': 5,
    'Chauffeur': 6,
    'Photographe': 7,
    'Policier/Policière': 8,
    'Agriculteur/Agricultrice': 9,
    'Avocat/Avocate': 10,
    'Mécanicien': 11,
    'Musicien/Musicienne': 12,
  };
  final List<String> typePieceList = [
    'Carte Nationale d\'Identité',
    'Passeport',
    'Permis de conduire',
    'Carte d\'électeur',
    'Certificat de naissance',
    'Carte de résident',
    'Carte de séjour',
    'Carte consulaire',
    'Document de voyage pour réfugiés',
    'Carte d\'étudiant',
    'Acte de mariage',
    'Carte professionnelle',
  ];
  final Map<String, int> typePieceListMap = {
    'Carte Nationale d\'Identité': 0,
    'Passeport': 1,
    'Permis de conduire': 2,
    'Carte d\'électeur': 3,
    'Certificat de naissance': 4,
    'Carte de résident': 5,
    'Carte de séjour': 6,
    'Carte consulaire': 7,
    'Document de voyage pour réfugiés': 8,
    'Carte d\'étudiant': 9,
    'Acte de mariage': 10,
    'Carte professionnelle': 11,
  };
  final List<String> typeVisaList = [
    'Visa touristique',
    'Visa de transit',
    'Visa de travail temporaire',
    'Visa de travail à long terme',
    'Visa étudiant',
    'Visa pour stages ou formations',
    'Visa de regroupement familial',
    'Visa pour visite familiale',
    'Visa diplomatique',
    'Visa officiel',
    'Visa de résidence permanente',
    'Visa de résidence temporaire',
    'Visa humanitaire',
    'Visa d\'investisseur',
    'Visa de start-up',
    'Visa de travailleur indépendant',
  ];
  final Map<String, int> typeVisaListMap = {
    'Visa touristique': 0,
    'Visa de transit': 1,
    'Visa de travail temporaire': 2,
    'Visa de travail à long terme': 3,
    'Visa étudiant': 4,
    'Visa pour stages ou formations': 5,
    'Visa de regroupement familial': 6,
    'Visa pour visite familiale': 7,
    'Visa diplomatique': 8,
    'Visa officiel': 9,
    'Visa de résidence permanente': 10,
    'Visa de résidence temporaire': 11,
    'Visa humanitaire': 12,
    'Visa d\'investisseur': 13,
    'Visa de start-up': 14,
    'Visa de travailleur indépendant': 15,
  };
  final List<String> etats = [
    'Célibataire',
    'Marié(e)',
    'Divorcé(e)',
    'Veuf/Veuve',
    'Séparé(e)',
    'PACS',
    'Union libre',
    'Concubinage',
    'Fiancé(e)',
  ];
  final Map<String, int> etatsMap = {
    'Célibataire': 0,
    'Marié(e)': 1,
    'Divorcé(e)': 2,
    'Veuf/Veuve': 3,
    'Séparé(e)': 4,
    'PACS': 5,
    'Union libre': 6,
    'Concubinage': 7,
  };
  final Map<String, int> lieuIdentificationMap = {
    'himbi 1': 0,
    'himbi 2': 1,
    'office': 2,
  };
  final List<String> lieuIdentification = [
    'himbi 1',
    'himbi 2',
    'office',
  ];

  final List<String> documentTypes = [
    "Img",
    "PDF",
    "DOCX",
    "Autre"
  ]; // Types disponibles
  final Map<String, IconData> documentIcons = {
    "Img": Icons.image,
    "PDF": Icons.picture_as_pdf,
    "DOCX": Icons.description,
    "Autre": Icons.insert_drive_file,
  };
  String? fileUrlPiece;
  String? fileUrlVisa;
  String? avartUrl;
  String? countryAdresse = "";
  String? countryNaissance = "";

  TextEditingController? numeroCarnet;
  TextEditingController? numeroParcelle;
  TextEditingController? numeroReferenceMenage;
  TextEditingController? numeroNoteReference;
  TextEditingController? nom;
  TextEditingController? postNom;
  TextEditingController? prenom;
  TextEditingController? nationalite;
  TextEditingController? numeroCarteResident;
  TextEditingController? numeroPieceIdentite;
  TextEditingController? referenceNaissance;
  TextEditingController? referenceAdresse;
  TextEditingController? numeroTelephone;
  TextEditingController? emailAdresse;
  TextEditingController? college;
  DateTime dateSave = DateTime.now();
  DateTime dateNaissance = DateTime.now();
  DateTime dateValidePiece = DateTime.now();
  DateTime dateOptention = DateTime.now();

  MenageController() {
    numeroCarnet = TextEditingController();
    numeroParcelle = TextEditingController();
    numeroReferenceMenage = TextEditingController();
    numeroNoteReference = TextEditingController();
    nom = TextEditingController();
    postNom = TextEditingController();
    prenom = TextEditingController();
    nationalite = TextEditingController();
    numeroCarteResident = TextEditingController();
    numeroPieceIdentite = TextEditingController();
    referenceNaissance = TextEditingController();
    referenceAdresse = TextEditingController();
    numeroTelephone = TextEditingController();
    emailAdresse = TextEditingController();
    college = TextEditingController();
  }
}
