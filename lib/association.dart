class association {
  late String associationName;
  late String description;
  late String associationMakerName;
  DateTime startDate = DateTime.now();
  late int memberCount;

  association(
      this.associationName, this.description, this.associationMakerName);

  void setMemberCount() {
    memberCount++;
  }

  void setDescription(String desc) {
    description = desc;
  }

  void setAssociationName(String name) {
    associationName = name;
  }

  int getMemberCount() {
    return memberCount;
  }

  String getDescription() {
    return description;
  }

  String getAssociationName() {
    return associationName;
  }

  String getAssociationMakerName() {
    return associationMakerName;
  }

  DateTime getStartDate() {
    return startDate;
  }
}
