clear all; close all; clc;

catchCount = 0;
%% checkerboard
try
    n = 5;
    a = [1 0 1 0 1;
         0 1 0 1 0;
         1 0 1 0 1;
         0 1 0 1 0;
         1 0 1 0 1];
    assert(isequal(a,checkerboard(n)))

    n = 4;
    a = [1 0 1 0;
         0 1 0 1;
         1 0 1 0;
         0 1 0 1];
    assert(isequal(a,checkerboard(n)))
catch
    disp('checkerboard test failed');
    catchCount = catchCount + 1;
end

%% sum_int
try
    x = 3;
    y_correct = 36;
    assert(isequal(sum_int(x),y_correct))

    x = 7;
    y_correct = 8256;
    assert(isequal(sum_int(x),y_correct))

    x = 10;
    y_correct = 524800;
    assert(isequal(sum_int(x),y_correct))
catch
    disp('sum_int test failed');
    catchCount = catchCount + 1;
end

%% goldbach
try
    nList = 28:6:76;
    for i = 1:length(nList)
      n = nList(i);
      [p1,p2] = goldbach(n);
      assert(isprime(p1) && isprime(p2) && (p1+p2==n));
    end

    nList = [18 20 22 100 102 114 1000 2000 36 3600];
    for i = 1:length(nList)
      n = nList(i);
      [p1,p2] = goldbach(n);
      assert(isprime(p1) && isprime(p2) && (p1+p2==n));
    end
catch
    disp('goldbach test failed');
    catchCount = catchCount + 1;
end

%% nearest numbers
try
    A = [30 46 16 -46 35 44 18 26 25 -10];
    correct = [8 9];
    [i1, i2] = nearestNumbers(A);
    assert(isequal([i1 i2],correct))

    A = [1555 -3288 2061 -4681 -2230 -4538 -4028 3235 1949 -1829];
    correct = [3 9];
    [i1, i2] = nearestNumbers(A);
    assert(isequal([i1 i2],correct))

    A = [-1 1 10 -10];
    correct = [1 2];
    [i1, i2] = nearestNumbers(A);
    assert(isequal([i1 i2],correct))
catch
    disp('nearest numbers test failed');
    catchCount = catchCount + 1;
end

%% is pangram
try
    x = 'The quick brown fox jumps over a lazy dog';
    y_correct = true;
    assert(isequal(isPangram(x),y_correct))

    x = 'The quick brown fox jumped over a lazy dog';
    y_correct = false;
    assert(isequal(isPangram(x),y_correct))

    x = 'Pack my box with five dozen liquor jugs';
    y_correct = true;
    assert(isequal(isPangram(x),y_correct))

    x = 'Sphinx of black quartz, judge my vow';
    y_correct = true;
    assert(isequal(isPangram(x),y_correct))
catch
    disp('isPangram test failed');
    catchCount = catchCount + 1;
end

%% sudoku
try
    input = [ 8 2 4 9 5 3 6 7 1
              6 3 5 8 1 7 9 2 4
              7 1 9 6 2 4 8 5 3
              5 8 7 2 9 1 3 4 6
              1 4 2 7 3 6 5 8 9
              3 9 6 4 8 5 2 1 7
              2 6 1 5 4 9 7 3 8
              4 7 8 3 6 2 1 9 5
              9 5 3 1 7 8 4 6 2 ];
    TF_correct = true;
    assert(isequal(sudokuIsSolved(input),TF_correct))

    input = [ 8 2 4 9 5 3 6 7 1
              6 3 5 8 1 7 9 2 4
              7 1 9 6 2 4 8 5 3
              5 8 7 2 9 1 3 4 6
              1 4 2 7 3 6 5 8 9
              3 9 6 4 8 5 2 1 7
              2 6 1 5 4 9 7 3 8
              4 7 8 3 6 2 1 9 5
              9 5 3 1 7 8 4 2 6 ];
    TF_correct = false;
    assert(isequal(sudokuIsSolved(input),TF_correct))

    input = [ 8 2 4 9 5 3 6 7 1
              3 6 5 8 1 7 9 1 4
              7 1 9 0 2 4 8 5 3
              5 8 7 2 9 1 3 4 6
              1 4 2 7 3 0 5 8 9
              6 9 6 4 8 5 2 1 7
              2 3 1 5 4 9 7 3 8
              4 7 8 3 6 2 1 9 5
              9 5 3 1 7 8 4 6 2 ];
    TF_correct = false;
    assert(isequal(sudokuIsSolved(input),TF_correct))

    input = zeros(9,9);
    TF_correct = false;
    assert(isequal(sudokuIsSolved(input),TF_correct))

    input = meshgrid(1:9,1:9);
    TF_correct = false;
    assert(isequal(sudokuIsSolved(input),TF_correct))

    input = toeplitz([1 9:-1:2],1:9);
    TF_correct = false;
    assert(isequal(sudokuIsSolved(input),TF_correct))

    input = [ 1 9 8 5 2 6 3 4 7
              7 2 5 3 4 1 6 9 8
              3 4 6 9 7 8 2 1 5
              9 8 1 2 5 7 4 6 3
              5 6 4 1 3 9 8 7 2
              2 3 7 6 8 4 1 5 9
              4 7 3 8 1 5 9 2 6
              8 1 9 7 6 2 5 3 4
              6 5 2 4 9 3 7 8 1 ]
    TF_correct = true;
    assert(isequal(sudokuIsSolved(input),TF_correct))
catch 
    disp('sudoku test failed');
    catchCount = catchCount + 1;
end

%% birthday candles
try
    len = 1; wid = 1;
    d_correct = 0.7071;
    assert(abs(birthdaycandles(len,wid)-d_correct)<1e-2);

    len = 2; wid = 3;
    d_correct = 1.8028;
    assert(abs(birthdaycandles(len,wid)-d_correct)<1e-2);

    len = 3; wid = 8;
    d_correct = 3.6056;
    assert(abs(birthdaycandles(len,wid)-d_correct)<1e-2)

    len = 4; wid = 3;
    d_correct = 2.5000;
    assert(abs(birthdaycandles(len,wid)-d_correct)<1e-2)

    len = 5; wid = 4;
    d_correct = 3.2016;
    assert(abs(birthdaycandles(len,wid)-d_correct)<1e-2)

    len = 5; wid = 6;
    d_correct = 3.9051;
    assert(abs(birthdaycandles(len,wid)-d_correct)<1e-2)

    len = 5; wid = 11;
    d_correct = 5.5200;
    assert(abs(birthdaycandles(len,wid)-d_correct)<1e-2)
catch
    disp('birthday candles test failed');
    catchCount = catchCount + 1;
end

%% triangle
try
    n = 1;
    t = 1;
    assert(isequal(triangle(n),t))

    n = 3;
    t = 6;
    assert(isequal(triangle(n),t))

    n = 5;
    t = 15;
    assert(isequal(triangle(n),t))

    n = 30;
    t = 465;
    assert(isequal(triangle(n),t))
catch
    disp('triangle test failed');
    catchCount = catchCount + 1;
end

%% remove nan rows
try
    A = [  1   5   8 
           -3 NaN  14 
            0   6 NaN ];
    B_correct = [  1   5   8 ];
    assert(isequal(remove_nan_rows(A),B_correct))

    A = 1:10;
    B_correct = A;
    assert(isequal(remove_nan_rows(A),B_correct))

    A = [   1   5   8 
           -3 NaN  14 
            0   6   6];
    B_correct = [1 5 8; 0 6 6];
    assert(isequal(remove_nan_rows(A),B_correct))

    A = [ 1 3 6 NaN 3 NaN]';
    B_correct = [1 3 6 3]';
    assert(isequal(remove_nan_rows(A),B_correct))

    A = [ 1 3 6 NaN;
          3 4 2  1];
    B_correct = [3 4 2 1];
    assert(isequal(remove_nan_rows(A),B_correct))
catch
    disp('remove nan rows test failed');
    catchCount = catchCount + 1;
end

%% Tests evaluation
if catchCount == 0
    disp('All tests passed!')
else
    disp([num2str(catchCount) ' functions failed unit test']);
end