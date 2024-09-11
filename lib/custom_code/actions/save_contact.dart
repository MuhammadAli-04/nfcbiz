import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:http/http.dart' as http;

Future saveContact(
  String? name,
  String? organization,
  String? primaryNumber,
  String? alternativeNumber,
  String? imageUrl,
) async {
  if (await FlutterContacts.requestPermission()) {
    final newContact = Contact();

    // Set Name
    newContact.name.first = name ?? '';

    // Set Organization
    newContact.organizations = [Organization(company: organization ?? '')];

    // Set Primary Number
    List<Phone> phones = [];
    if (primaryNumber?.isNotEmpty ?? false) {
      phones.add(Phone(primaryNumber ?? ''));
    }

    if (phones.isNotEmpty) {
      newContact.phones = phones;
    }

    // Set Avatar from Network Image
    if (imageUrl != null && imageUrl.isNotEmpty) {
      try {
        final response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          final Uint8List imageData = response.bodyBytes;
          newContact.photo = imageData;
        } else {
          print('Failed to download image: ${response.statusCode}');
        }
      } catch (e) {
        print('Error downloading image: $e');
      }
    }

    FFAppState().update(() {
      FFAppState().isContactSaving = false;
    });

    // Insert and open for editing
    final savedContact = await newContact.insert();
    await FlutterContacts.openExternalEdit(savedContact.id);
  }
}
