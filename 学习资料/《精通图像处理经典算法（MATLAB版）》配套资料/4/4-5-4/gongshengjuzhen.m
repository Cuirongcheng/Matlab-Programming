I = imread('cameraman.tif');
subplot(111),imshow(I);
glcms=graycomatrix(I);
stats1=graycoprops(glcms,'Contrast')
stats2=graycoprops(glcms,'Correlation')
stats3=graycoprops(glcms,'Energy')
stats4=graycoprops(glcms,'Homogeneity')
