classdef MatrixInvClassTest < matlab.unittest.TestCase
    %AdjMatrixClassTest is test class function to test adjMattrix function
    %   
    properties (TestParameter) %% parameters that will be used in test methods
        %% square marixes taken from book "Linearna algebra" Momir V. ?eli? i Biljana Sukara-?eli? published 2010
        squareMatrixes = struct('squareMatrixes1',[1 3;2 5],'squareMatrixes2',[2 1 1; 6 2 1; -2 2 1]); 
        squareMatrixInverse = struct('squareMatrixInverse1',[-5 3; 2 -1],'squareMatrixInverse2',[0 1 -1; -8 4 4; 16 -6 -2]./8);
        %% scalars
        scalars = struct('scalar1',1,'scalar2',3,'scalar3',4,'scalar4',6,'scalar5',-1);
        scalarInverse = struct('scalarInverse1',1,'scalarInverse2',1/3,'scalarInverse3',0.25,'scalarInverse4',1/6,'scalarInverse5',-1)
        %% square marixes with complex numbers     
        squareMatrixWithComplexNumbers = struct('matixWithComplexNumbers1', [3+2i,1+5i;-3+2i, 3-2i],'matixWithComplexNumbers2', [2i,1+5i;-3+2i, 3]);
        squareMatrixAdjungateWithComplexNumbers = struct('squareMatrixAdjungateWithComplexNumbers1', [3-2i,-1-5i;3-2i, 3+2i],'squareMatrixAdjungateWithComplexNumbers2', [3,-1-5i ;3-2i, 2i]);
        %% variables design or verify errors
        nonSquareMatrixes = struct('nonSquareMatrixes1',[1 2;],'nonSquareMatrixes2',[1 2; pi 10; 5 9],'nonSquareMatrixes3',[1 10 5; -1 -2 2;]);
        emptyMatrix = struct('emptyMatrix',[]); 
        vectorRows = struct('vectorRow1',[1 2 -1 -2],'vectorRow2',[1 2 5 -1 -2 10],'vectorRow3',[1 10 2 5 -1 -2 10 2]);
        vectorColumns = struct('vectorColumn1',[1 2 -1 -2]','vectorColumn2',[1 2 5 -1 -2 10]','vectorColumn3',[1 10 2 5 -1 -2 10 2]');
        cells = {{1},{3},{[55, 22; 3 3]},{[55, 22, 3, 3]}};
        squareMatrixOfCells ={[{1} {2}; {-1} {-2}],[{1} {2} {-2}; {-1} {-2},{-4}]};
        squareMatrixWithString =struct('stringMatrix1',[1, 2; '3', 4],'stringMatrix2',['1', '2'; '3', '4']);
        squareMultidimensionalArray = struct('multidimensionalArray1', ones(4,4,5),'multidimensionalArray2', zeros(2,2,6));
    end
    properties
       calculationError  
    end
    methods(TestClassSetup) %% runs when test class is about to close
        function setupOnce(testCase)
            format long
            testCase.calculationError = 10^(-12);
        end
    end
    methods(TestClassTeardown) %% runs when test class is about to close
        function teardownOnce(testCase)
            format short
        end
    end
    %% test values
    methods (Test, ParameterCombination = 'sequential')
        function testInverseSquareMatrix(testCase, squareMatrixes,squareMatrixInverse)
            actualSolution = matrixInv(squareMatrixes);
            expectedSolution = squareMatrixInverse;
            verifyLessThan(testCase,maximumValue(abs(actualSolution-expectedSolution)), testCase.calculationError, 'Adungate matrix is wrong')
        end
        function testInverseSquareMatrixViaFormula(testCase, squareMatrixes,squareMatrixInverse)
            %% inverse martrix needs to satisfy formula 
            % matrixInv(A) * A = A * matrixInv(A) = eye(size(A))
            actualSolution = matrixInv(squareMatrixes);
            expectedSolution = squareMatrixInverse;
            verifyLessThan(testCase,maximumValue(abs(actualSolution-expectedSolution)), testCase.calculationError, 'Adungate matrix is wrong')
        end
%         function testSquareMatrixWithComplexNumberDeterminant(testCase, squareMatrixWithComplexNumbers, squareMatrixAdjungateWithComplexNumbers)
%             actualSolution = adjMatrix(squareMatrixWithComplexNumbers);
%             expectedSolution = squareMatrixAdjungateWithComplexNumbers;
%             verifyLessThan(testCase,maximumValue(abs(actualSolution-expectedSolution)), testCase.calculationError, 'Adungate matrix is wrong')
%         end
    end
%     methods (Test, ParameterCombination = 'pairwise')
%         function testScalarAdjungate(testCase, scalars, scalarAdjungate)
%             actualSolution = adjMatrix(scalars);
%             expectedSolution = scalarAdjungate;
%             verifyLessThan(testCase,maximumValue(abs(actualSolution-expectedSolution)), testCase.calculationError, 'Adungate matrix is wrong')
%         end 
%     end
%     %% test for errors
%     methods (Test)
%         function testAdungateNonSquareMatrix(testCase, nonSquareMatrixes)
%              verifyError(testCase,@() adjMatrix(nonSquareMatrixes),?MException, 'Can''t calculate adjungate of non square row')
%         end
%         function testAdungateVectorRow(testCase, vectorRows)
%              verifyError(testCase,@() adjMatrix(vectorRows),?MException, 'Can''t calculate adjungate of vector row')
%         end
%         function testAdungateVectorColumns(testCase, vectorColumns)
%              verifyError(testCase,@() adjMatrix(vectorColumns),?MException, 'Can''t calculate adjungate of vector column')
%         end
%         function testEmprtyMatrix(testCase,emptyMatrix)
%             verifyError(testCase,@() adjMatrix(emptyMatrix),?MException,'Can''t calculate adjungate empty matrix')
%         end
%         function testMatrixDetWithoutInputArgument(testCase)
%             verifyError(testCase,@() adjMatrix(),?MException,'Can''t calculate adjungate if there isn''t any input variable')
%         end 
%         function testCells(testCase,cells)
%             verifyError(testCase,@() adjMatrix(cells),?MException,'Can''t calculate adjungate of cell')
%         end
%         function testSquareMatrixWithCells(testCase,squareMatrixOfCells)
%             verifyError(testCase,@() adjMatrix(squareMatrixOfCells),?MException,'Can''t calculate adjungate of cell')
%         end       
%         function testSquareMatrixWithString(testCase,squareMatrixWithString)
%             verifyError(testCase,@() adjMatrix(squareMatrixWithString),?MException,'Can''t calculate adjungate when at least one element is string or char')
%         end
%         function testSquareMultidimensionalArray(testCase,squareMultidimensionalArray)
%             verifyError(testCase,@() adjMatrix(squareMultidimensionalArray),?MException,'Can''t calculate adjungate of multidimensional array')
%         end
%     end
end

