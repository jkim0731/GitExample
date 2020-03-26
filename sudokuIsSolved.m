function tf = sudokuIsSolved(S)
% Make a function that checks to see if a 9x9 matrix of integers represents a completed sudoku puzzle.

% The function will return true only when it's a completed sudoku puzzle. A value of 0 refers to a blank entry.
tf = all(S(:));
end

