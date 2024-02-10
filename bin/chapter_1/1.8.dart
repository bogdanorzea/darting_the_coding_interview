/// Write an algorithm such that if an element is an MxN matrix is 0,
/// it's entire row and column are set to 0.
void main(List<String> args) {
  final sol = solution(
    Matrix([
      [01, 02, 03, 04],
      [05, 06, 07, 08],
      [09, 10, 00, 12],
      [13, 14, 15, 16],
    ]),
  );

  final expected = Matrix([
    [01, 02, 00, 04],
    [05, 06, 00, 08],
    [00, 00, 00, 00],
    [13, 14, 00, 16],
  ]);

  assert(sol.toString() == expected.toString());
}

class Matrix {
  Matrix(this.value);

  final List<List<int>> value;

  @override
  String toString() {
    return value.map((e) => e.join()).join();
  }
}

Matrix solution(Matrix matrix) {
  final m = matrix.value.first.length; // columns
  final n = matrix.value.length; // rows

  final zeroRows = <int>[];
  final zeroColumn = <int>[];

  for (var i = 0; i < n; i++) {
    for (var j = 0; j < m; j++) {
      if (matrix.value[i][j] == 0) {
        zeroRows.add(i);
        zeroColumn.add(j);
      }
    }
  }

  // Zero rows
  for (int i in zeroRows) {
    for (int c = 0; c < m; c++) {
      matrix.value[i][c] = 0;
    }
  }

  // Zero columns
  for (int i in zeroColumn) {
    for (int r = 0; r < n; r++) {
      matrix.value[r][i] = 0;
    }
  }

  return matrix;
}
