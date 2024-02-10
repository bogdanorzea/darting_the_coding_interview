/// Implement a basic string compression using the counts of repeated characters
void main(List<String> args) {
  assert(solution('abc') == 'abc');
  assert(solution('aabcccccaaa') == 'a2b1c5a3');
}

String solution(String input) {
  StringBuffer compressedString = StringBuffer('');

  int i = 0;

  while (i < input.length) {
    int j = i;

    int currentCount = 0;
    while (j < input.length && input[i] == input[j]) {
      currentCount++;
      j++;
    }

    compressedString.write('${input[i]}$currentCount');

    i = j;
  }

  return compressedString.length > input.length
      ? input
      : compressedString.toString();
}
