class Following {
  final String pictUrl;
  final String name;
  final String email;

  Following({
    required this.pictUrl,
    required this.name,
    required this.email,
  });
}

var followingList = [
  Following(
    pictUrl: 'assets/images/user4.jpg',
    name: 'Clara Bernath',
    email: '@Selebgram',
  ),
  Following(
    pictUrl: 'assets/images/user3.jpg',
    name: 'Boy Candra',
    email: '@Penulis Buku',
  ),
  Following(
    pictUrl: 'assets/images/user2.jpg',
    name: 'Adreto',
    email: '@Tukang baca puisi',
  ),
  Following(
    pictUrl: 'assets/images/user1.jpg',
    name: 'Anselma Putri',
    email: '@Rajin Menabung',
  ),
];
