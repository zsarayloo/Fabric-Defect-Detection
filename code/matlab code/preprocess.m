function I=preprocess(I)
I=im2double(I);
I=rgb2gray(I);% convert 2 gray
K=imadjust(I); % improve contrast
I=medfilt2(K,[5 5]);


