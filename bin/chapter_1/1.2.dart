/// Given two strings, write a method to decide if one is a permutation of another
void main(List<String> args) {
  assert(solution('abc', 'cabs') == false);
  assert(solution('abc', 'cab') == true);

  assert(solution2('abc', 'cab') == true);
  assert(solution2('abc', 'cab') == true);
}

bool solution(String first, String second) {
  if (first.length != second.length) return false;
  final firstArray = first.split('')..sort();
  final secondArray = second.split('')..sort();

  for (var i = 0; i < firstArray.length; i++) {
    if (firstArray[i] != secondArray[i]) return false;
  }

  return true;
}

bool solution2(String first, String second) {
  // If the strings have different lenghts, then they are not permutations
  if (first.length != second.length) return false;

  // Populate a map with key as char and value the occurrence of that char in the first string
  final counts = <String, int>{};
  for (var i = 0; i < first.length; i++) {
    final char = first[i];
    counts.update(char, (v) => v + 1, ifAbsent: () => 1);
  }

  // Check that all chars in the second string have the same occurrence as in the first string
  for (var i = 0; i < second.length; i++) {
    final char = second[i];

    // If there is a character in second string that is not in the first one, then the two strings are not permutations
    if (counts[char] == null) return false;

    counts[char] = counts[char]! - 1;
    if (counts[char]! < 0) return false;
  }

  // Finally check to see that there are no values greater than 0
  return counts.values.firstWhere((v) => v > 0, orElse: () => -1) == -1;
}
