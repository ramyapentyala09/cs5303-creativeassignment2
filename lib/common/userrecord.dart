class UserRecord {
  late String email;
  late String password;
  late String name;
  late String protein;
  late String height;
  late String weight;

  UserRecord({
    this.email = '',
    this.password = '',
    this.name = '',
    this.height = '',
    this.protein = '',
    this.weight = '',
  });

  static UserRecord data = UserRecord();
  static List<UserRecord> fakeDB = [
    UserRecord(
      email: 'ramya@gmail.com',
      password: 'ram456',
      name: 'Ramya',
      height: '5.4 ft',
      protein: 'medium',
      weight: '60 kg',
    ),
    UserRecord(
      email: 'ramya@uco.edu',
      password: 'ram123',
      name: 'Pentyala',
      height: '6.0 ft',
      protein: 'medium',
      weight: '60 kg',
    ),
  ];
}
