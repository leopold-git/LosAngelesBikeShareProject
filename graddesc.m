fulltable = readtable('day.csv');
% 2nd column (dteday) can be removed, this column gives us 
% a date that increments by one, we can use the instant column
% as an indicator of days passed. the dteday column is not needed.
% instant gives us # of days since program inception

fulltable(:,"dteday") = []; % eliminate date
fulltable(:,"instant") = [];    % eliminate year
fulltable(:,"yr") = [];

trainingDay1 = table2array(fulltable);

[testDay, trainingDay] = splitTestTraining(trainingDay1,0); 



% LIN REGRESSION WITH GRAD DESCENT
% feature selectin reduced the number of feats i.e. coeffs
% now try to minimize loss for lin reg via gradient descent
% loss function
% we ended up with 6 features: perform gradient descent using these 6
% features. left over features are shwon below.



% initialize betas to 0
beta0 = 0;  % intercept
beta1 = 0;  % feat 1 : weekday
beta2 = 0;  % feat 2 : workingday
beta3 = 0;  % feat 3 : weathersit
beta4 = 0;  % feat 4 : atemp
beta5 = 0;  % feat 5 : humidity
beta6 = 0;  % feat 6 : registered users

% learning rate
L = 0.0001;
epochs = 10000;
N = size(trainingDay ,1);
MSE = [];
iterations = [];
    x1 = trainingDay(:,4);
    x2 = trainingDay(:,5);
    x3 = trainingDay(:,6);
    x4 = trainingDay(:,8);   
    x5 = trainingDay(:,9);
    x6 = trainingDay(:,12);
    Y = trainingDay(:,13);
    
    
     beta0 = 1;
    beta1 = 1;
    beta2 = 1;
    beta3 = 1;
    beta4 = 1;
    beta5 = 1;
    beta6 = 1;
           
    beta0_der =  0;
    beta1_der =  0;
    beta2_der = 0;
    beta3_der = 0;
    beta4_der =0;
    beta5_der = 0;
    beta6_der = 0;
    N = size(x4,1);
    
    for i = 1:1000
            yhats = beta0 + beta1*x1 + beta2*x2 + beta3*x3 + beta4*x4 + beta5*x5 + beta6*x6;


        
        
           
    beta0_der =  (-2/N) * sum(Y-yhats,1);
    beta1_der =  (-2/N) * sum(x1.*(Y-yhats),1);
    beta2_der = (-2/N) * sum(x2.*(Y-yhats),1);
    beta3_der = (-2/N) * sum(x3.*(Y-yhats),1);
    beta4_der = (-2/N) * sum(x4.*(Y-yhats),1);
    beta5_der = (-2/N) * sum(x5.*(Y-yhats),1);
    beta6_der = (-2/N) * sum(x6.*(Y-yhats),1);

   
    % update our coefficients using derivatives, learning rate, and current
    % betas
   
    beta0 = beta0 - (0.00001*beta0_der)
    beta1 = beta1 - (0.00001*beta1_der)
    beta2 = beta2 - (0.00001*beta2_der)
    beta3 = beta3 - (0.00001*beta3_der)
    beta4 = beta4 - (0.00001*beta4_der)
    beta5 = beta5 - (0.00001*beta5_der)
    beta6 = beta6 - (0.00001*beta6_der)
        
    end 
    



 
