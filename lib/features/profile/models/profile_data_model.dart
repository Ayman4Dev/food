class ProfileDataModel {
  const ProfileDataModel({
    required this.name,
    required this.email,
    required this.address,
    required this.passwordMask,
    required this.cardType,
    required this.cardAlias,
    required this.cardNumberMask,
    required this.avatarAsset,
  });

  final String name;
  final String email;
  final String address;
  final String passwordMask;
  final String cardType;
  final String cardAlias;
  final String cardNumberMask;
  final String avatarAsset;

  ProfileDataModel copyWith({
    String? name,
    String? email,
    String? address,
    String? passwordMask,
    String? cardType,
    String? cardAlias,
    String? cardNumberMask,
    String? avatarAsset,
  }) {
    return ProfileDataModel(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      passwordMask: passwordMask ?? this.passwordMask,
      cardType: cardType ?? this.cardType,
      cardAlias: cardAlias ?? this.cardAlias,
      cardNumberMask: cardNumberMask ?? this.cardNumberMask,
      avatarAsset: avatarAsset ?? this.avatarAsset,
    );
  }
}
