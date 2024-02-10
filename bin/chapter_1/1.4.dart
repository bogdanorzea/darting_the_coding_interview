/// Given a string, write a function to check if it's a permutation of a palindrome.
/// Ignore casing and non-letter characters.
void main(List<String> args) {
  assert(solution('Tact Coa') == true);
  assert(solution('Tat Coa') == false);
}

bool solution(String input) {
  final cleanInput = input.toLowerCase();

  final occurrenceMap = <String, int>{};

  int oddCount = 0;
  for (var i = 0; i < cleanInput.length; i++) {
    final char = cleanInput[i];

    // Check if the char is valid character for a palindrome
    if ('a'.compareTo(char) <= 0 && char.compareTo('z') <= 0) {
      occurrenceMap.update(char, (value) => value + 1, ifAbsent: () => 1);

      // Keep track of the odd occurrence counts
      if (occurrenceMap[char]! % 2 == 1) {
        oddCount++;
      } else {
        oddCount--;
      }
    }
  }

  // Palindromes can have at most 1 odd occurrence
  return oddCount <= 1;
}
