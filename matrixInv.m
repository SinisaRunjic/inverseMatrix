function inverse  = matrixInv( matrix )
%marixInv function that calculates martix inverse via formula A^(-1) =
%adjMatrix(A)/matrixDet(A)
    %% test number of input arguments
    assert(nargin>0,'Provide input argument');
    [matrixRow,matrixColumn, matrixLayer] = size(matrix);
    %% test if matix is a cell 
    assert(~iscell(matrix),'Input that you provide is a cell');
    %% test if matrix is square
    assert(matrixRow == matrixColumn,'Matrix isn''t square');
    %% test if matrix is multidimensional array
    assert(matrixLayer == 1,'Variable that you provide is multidimensional array');
    %% test if matrix has elements
    assert(matrixRow ~= 0 & matrixColumn ~= 0 ,'Matrix that you provide doesn''t have any elements');
    %% test if matrix is numeric
    assert(isnumeric(matrix),'At least one element in matrix isn''t numeric');
    %% calculation
    matrixDeterminant = matrixDet(matrix);
    assert(matrixDeterminant ~= 0,'Can''t find inverse matrix if determinant is 0');
    inverse = adjMatrix(matrix)./matrixDeterminant;
end

