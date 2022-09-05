function adjugateMatrix  = adjMatrix( matrix )
%inversMatrix calclate adjugate matrix 
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
    adjugateMatrix = ones(matrixRow,matrixColumn);
    if(matrixRow > 1)
        for i = 1:matrixRow
            for j = 1:matrixColumn
                adjugateMatrix(i,j) = (-1)^(j+i)*matrixDet(matrix([1:i-1 i+1:end],[1:j-1 j+1:end]));
            end
        end
    end
    adjugateMatrix = adjugateMatrix.';
end

