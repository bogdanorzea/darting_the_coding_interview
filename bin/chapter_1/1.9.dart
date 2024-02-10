/// Assume you have a method isSubstring which checks if one word is a substring of another.
///Given two strings s1 and s2, write a code to check if s2 is a rotation of s1 using only one call to isSubstring
void main(List<String> args) {
  assert(solution("waterbottle", "erbottlewat") == true);
}

bool solution(String s1, String s2) {
  if (s1.length != s2.length) return false;

  return (s1 + s1).contains(s2);
}
