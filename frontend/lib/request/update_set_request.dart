class UpdateSetRequest {
  final String guid;
  final String name;
  final bool deleted;

  UpdateSetRequest({
    this.guid,
    this.name,
    this.deleted,
  });
}