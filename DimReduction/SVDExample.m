%% This script gives an example of SVD in MATLAB.

%% Built-in example dataset
M = peaks;
surf(peaks)

%% Factor the dataset with SVD
[U, S, V] = svd(M);

%% We can see that the first three factors are more or less sufficient to recreate the original
S(find(S))

%% Plot the first three factors along with the original
M1 = U(:, 1)*S(1,1)*V(:,1).';
M2 = U(:, 2)*S(2,2)*V(:,2).';
M3 = U(:, 3)*S(3,3)*V(:,3).';

figure;
subplot(2, 2, 1);
surf(M)
title('Original matrix')
subplot(2, 2, 2);
surf(M1)
title('First factor')
subplot(2, 2, 3);
surf(M2)
title('Second factor')
subplot(2, 2, 4);
surf(M3)
title('Third factor')

%% Add the factors and compare it to the original
approxM = M1 + M2 + M3;

figure;
subplot(1, 2, 1)
surf(M)
title('Original matrix')
subplot(1, 2, 2)
surf(approxM)
title('Approximated matrix')