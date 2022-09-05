function maxValue = maximumValue( matrix )
% maximumValue function takes scalar, vector or matrix and returns
% maximum value that is in it.
    %% test if provide string or vector and martix is numeric
    assert(isnumeric(matrix),'Variable that you provide has at least one non numeric element')
    %% test if input variable is cell) 
    assert(~iscell(matrix),'Variable that you provide is a cell')
    %% test if input variable has a complex number
    [row, col, layer] = size(matrix);
    assert(layer == 1,'Variable that you provide is multidimensional array')
    assert(min(min(imag(matrix) == zeros(row,col))),'Variable that you provide has at least one complex number')
    %% find maximum value in variable
    maxValue = matrix(1,1);
    for i = 1:row
       for j = 1:col
           if(maxValue < matrix(i,j))
              maxValue =  matrix(i,j);
           end
       end 
    end
end