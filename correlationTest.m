
% takes dataset as input and uses R value to determine association b/w
% features, returns new dataset minus the feat that is most strongly
% associated in pair 
function [trainingDay] = correlationTest(trainingDay)
labels = trainingDay(:, end);    
R = corrcoef(trainingDay(:,1:end-1),'Rows','pairwise');
    R
    temp = trainingDay(:, 1:end-1);
    for i = 1 : size(R,1)
    done = 0; % use this boolean to make sure not both corr feats get eliminated

        for j = 1 : size(R,2)
          
            if R(i,j) > 0.7 && i ~= j    % feats are correlated and are not the same feature
                R(i,j);
                % update our table and our data
                %plot(currencyTrainSet(:,i), currencyTrainSet(:,j), '*');
               % disp('CORR!');
                 %disp(i);
                % between the 2 feats in the correlated pair, throw out the
                % one that is less associated to others. 
                for k = 1:size(R)
                   oneSum = sum(abs(R(k, i)));
                   twoSum = sum(abs(R(k, j)));
                end
                if oneSum >= twoSum && done == 0
                   temp(:,i) = [];
                   done = 1;
                elseif oneSum < twoSum && done == 0
                    temp(:,j) = [];
                    done = 1;
                end
            end 
        end
    end
    % output new dataset without the eliminated feature(s)
    disp('Eliminated any correlated features.')
    trainingDayUpd = temp;
    trainingDayUpd = [trainingDayUpd, labels]
end