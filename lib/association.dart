class association {
  late String associationName;
  late String Description;
  late String associationmakerName;
  DateTime startDate = DateTime.now();
  late int memberCount;

  association(
      this.associationName, this.Description, this.associationmakerName);

  void setMemberCount() {
    memberCount++;
  }

  void setDescription(String desc) {
    Description = desc;
  }

  void setAssociationName(String name) {
    associationName = name;
  }

  int getMemberCount() {
    return memberCount;
  }

  String getDescription() {
    return Description;
  }

  String getAssociationName() {
    return associationName;
  }

  String getAssociationmakerName() {
    return associationmakerName;
  }

  DateTime getStartDate() {
    return startDate;
  }
}
