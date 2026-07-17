const String contactsTable = 'contacts';
const String contactsColId = 'id';
const String contactsColName = 'name';
const String contactsColMobile = 'mobile';
const String contactsColEmail = 'email';
const String contactsColAddress = 'address';
const String contactsColWebsite = 'website';
const String contactsColImage = 'image';
const String contactsColCompany = 'company';
const String contactsColDesignation = 'designation';
const String contactsColFavorite = 'favorite';

class ContactModel {
  int id;
  String contactName;
  String mobile;
  String email;
  String address;
  String website;
  String image;
  String company;
  String designation;
  bool favorite;
  ContactModel({
    this.id = -1,
    required this.contactName,
    required this.mobile,
    this.email = '',
    this.address = '',
    this.website = '',
    this.designation = '',
    this.image = 'assets/images/person.jpg',
    this.company = '',
    this.favorite = false,
  });

  factory ContactModel.fromMap(Map<String, dynamic> map) => ContactModel(
    contactName: map[contactsColName],
    mobile: map[contactsColMobile],
    email: map[contactsColEmail],
    address: map[contactsColAddress],
    website: map[contactsColWebsite],
    image: map[contactsColImage],
    company: map[contactsColCompany],
    designation: map[contactsColDesignation],
    favorite: map[contactsColFavorite] == 0 ? false : true,
    id: map[contactsColId],
  );

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      contactsColName: contactName,
      contactsColMobile: mobile,
      contactsColEmail: email,
      contactsColAddress: address,
      contactsColWebsite: website,
      contactsColImage: image,
      contactsColCompany: company,
      contactsColDesignation: designation,
      contactsColFavorite: favorite ? 1 : 0,
    };
    if (id > 0) {
      map[contactsColId] = id;
    }
    return map;
  }
}
