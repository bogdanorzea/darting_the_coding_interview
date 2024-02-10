/// There are three types of edits that can be performed on sings: insert a character, remove a character,
/// or replace a character.
/// Given two strings, write a function to check if they are one edit (or zero edits) away.
void main(List<String> args) {
  assert(solution('pale', 'pale') == true);
  assert(solution('pale', 'pal') == true);
  assert(solution('pales', 'pale') == true);
  assert(solution('pale', 'bale') == true);
  assert(solution('pale', 'bake') == false);

  assert(solution('pale', 'bakes') == false);
}

bool solution(String first, String second) {
  if (first.length > second.length) return solution(second, first);

  if ((first.length - second.length).abs() > 1) return false;

  bool foundDifference = false;

  int i = 0;
  int j = 0;
  while (i < first.length && j < second.length) {
    if (first[i] != second[j]) {
      if (foundDifference) return false;

      foundDifference = true;

      if (first.length == second.length) i++;
    } else {
      i++;
    }

    j++;
  }
  return true;
}
