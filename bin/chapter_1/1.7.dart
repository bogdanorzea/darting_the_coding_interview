/// Given an image represented by an NxN matrix, where each pixel is represented by an integer,
/// write a method to rotate the image by 90°. Can you do this in place
void main(List<String> args) {
  final sol = solution(
    Matrix([
      [01, 02, 03, 04],
      [05, 06, 07, 08],
      [09, 10, 11, 12],
      [13, 14, 15, 16],
    ]),
  );

  final expected = Matrix([
    [13, 09, 05, 01],
    [14, 10, 06, 02],
    [15, 11, 07, 03],
    [16, 12, 08, 04],
  ]);

  assert(sol.toString() == expected.toString());
}

class Matrix<T> {
  Matrix(this.value) {
    for (var element in value) {
      assert(element.length == value.length);
    }
  }

  final List<List<T>> value;

  int get length => value.length;

  @override
  String toString() {
    return value.map((e) => e.join()).join();
  }
}

Matrix<T> solution<T>(Matrix<T> matrix) {
  int size = matrix.length;
  while (size > matrix.length / 2) {
    for (var i = 0; i < size / 2; i++) {
      for (var j = i; j < size - 1; j++) {
        final temps = [
          matrix.value[i][j], // top left
          matrix.value[j][size - 1], // top right
          matrix.value[size - 1][matrix.length - 1 - j], // bottom right
          matrix.value[matrix.length - 1 - j][i], // bottom left
        ];

        // Swap the values of the corners
        matrix.value[i][j] = temps[3];
        matrix.value[j][size - 1] = temps[0];
        matrix.value[size - 1][matrix.length - 1 - j] = temps[1];
        matrix.value[matrix.length - 1 - j][i] = temps[2];
      }

      size--;
    }
  }

  return matrix;
}
