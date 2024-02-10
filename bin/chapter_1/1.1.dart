/// Implement an algorithm to determine if a string has all unique characters.
/// What if you cannot use additional data structures?
void main(List<String> args) {
  assert(solution('abc') == true);
  assert(solution('abca') == false);
}

bool solution(String input) {
  final results = <String, bool>{};

  for (int i = 0; i < input.length; i++) {
    var char = input[i];
    if (results[char] != null) return false;

    results[char] = true;
  }

  return true;
}
