
class Posts {
  final String title ;
  final String ar_text;
  final String en_title ;
  final String quz ;
  final String en_quz ;
  final String en_text;
  final String source;
  final String creatorName;
  final String category;
  final String department;
  final String createdDate;
  final String updatedDate;
  final String description;
  final String deviceNo;
  final int views;


  Posts(  {
    required this.title,
    required this.source,
    required this.creatorName,
    required this.quz,
    required this.ar_text,
    required this.createdDate,
    required this.en_quz,
    required this.en_text,
    required this.en_title,
    required this.updatedDate,
    required this.category,
    required this.department,
    required this.description,
    required this.deviceNo,
    required this.views,
  });
}
