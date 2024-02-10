// Write a method to replace all spaces in a string with '%20'
void main(List<String> args) {
  // assert(solution('Mr John Smith     ') == 'Mr%20John%20Smith');
  assert(solution2('Mr John Smith    '.split('')) == 'Mr%20John%20Smith');
}

String solution(String input) {
  return input.trim().replaceAll(' ', '%20');
}

String solution2(List<String> inputs) {
  final length = inputs.length;
  var position = 0;
  while (position < length) {
    final char = inputs[position];

    if (char == ' ') {
      inputs
        ..removeAt(position)
        ..insert(position, "0")
        ..insert(position, "2")
        ..insert(position, "%");

      inputs
        ..removeLast()
        ..removeLast();

      position += 3;
    } else {
      position++;
    }
  }

  return inputs.join();
}
