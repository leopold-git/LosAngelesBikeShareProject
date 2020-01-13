% accuracy set contains 3 scores -- one for each model for this particular
% fold, will collect for all 10 folds and average and compare
% returns the columns to throw out
function [currentBestInd] = irrelevantFeats(currentTrain, currentVal)
    % train the tree on columns 1 thru end-1, labels are last column
    % test the tree using valTest

   
    
    % try to find optimal number of number of features--one with highest
    % accuracy
   currentBestAcc = 0;
    currentBestInd = 0;
     for ind=1: size(currentTrain,2)-1
        sample = currentTrain (:,ind);
        slabels = currentTrain (:, end);
        tree = fitctree(sample , slabels);

           positive = 0;
                for k = 1: size(currentVal,1)
                    label = predict(tree, currentVal(k , ind));
                    if label == currentVal(k, end)
                        positive = positive +1;
                    end
                end
                accuracy = positive/size(currentVal,1);
                if accuracy > currentBestAcc 
                   currentBestAcc = accuracy;
                    currentBestInd = ind;

                end
     end
 currentBestAcc;
 currentBestInd;
 combos = nchoosek(1:size(currentTrain,2)-1,2);
 % look for a combination of indices for columns that lead to higher
 % accuracy when predicting on val set
 for i=1:size(combos,1)
      sample = currentTrain (:,combos(i,1):combos(i,2));
        slabels = currentTrain (:, end);
        tree = fitctree(sample , slabels);
            combos(i,1);
            combos(i,2);
           positive = 0;
                for k = 1: size(currentVal,1)
                    label = predict(tree, currentVal(k , combos(i,1):combos(i,2)));
                    if label == currentVal(k, end)
                        positive = positive +1;
                    end
                end
                accuracy = positive/size(currentVal,1);
                if accuracy > currentBestAcc 
                   currentBestAcc = accuracy;
                    currentBestInd = [combos(i,1),combos(i,2)];
                    
                end
 end
 
 
 
 
 
 
 


end