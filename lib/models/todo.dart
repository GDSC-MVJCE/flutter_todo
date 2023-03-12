class Todo{
  late final String title;
  
  Todo({
    required this.title
  });
}

final Todo clean = Todo(title: "Clean house");
final Todo study = Todo(title: "Study");
final Todo goclg = Todo(title: "Go College");

List<Todo> todos = [clean, study, goclg];