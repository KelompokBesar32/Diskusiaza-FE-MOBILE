class Notif {
  String? grupName;
  String? pengirim;
  String? waktu;
  String? desc;
  String? pictUrl;

  Notif({
    this.grupName,
    this.pengirim,
    this.waktu,
    this.desc,
    this.pictUrl,
  });
}

var notifList = [
  Notif(
    grupName: 'Ruang tunggu Mantan',
    pengirim: 'Bambang Tampan',
    waktu: '28 Mei',
    desc: 'Sebutkan 5 nama-nama mantan terindah kamu?',
    pictUrl: 'assets/images/user1.jpg',
  ),
  Notif(
    grupName: 'Ruang Jomblo',
    pengirim: 'Miku yang tersakiti',
    waktu: '28 Mei',
    desc: 'Berapa lama lu jomblo?',
    pictUrl: 'assets/images/user2.jpg',
  ),
  Notif(
    grupName: 'Akane Mizuno',
    pengirim: 'luffy si penyayang',
    waktu: '28 Mei',
    desc: 'Siapa waifu kamu?',
    pictUrl: 'assets/images/user3.jpg',
  ),
];
