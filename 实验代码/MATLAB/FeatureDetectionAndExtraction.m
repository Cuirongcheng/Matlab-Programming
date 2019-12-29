
% 读入图片
wahaha1 = imread('image1.jpg');
wahaha=rgb2gray(wahaha1);
scenceImage = imread('image2.jpg');
sceneImage=rgb2gray(scenceImage);


% 检测特征点
boxPoints = detectSURFFeatures(wahaha);
scenePoints = detectSURFFeatures(sceneImage);
 
figure; 
imshow(wahaha);
title('100 Strongest Feature Points from wahaha Image');
hold on;
plot(selectStrongest(boxPoints, 100));
 
figure; 
imshow(sceneImage);
title('300 Strongest Feature Points from Scene Image');
hold on;
plot(selectStrongest(scenePoints, 300));


% 提取特征描述子
boxFeatures = extractFeatures(wahaha,boxPoints); 
sceneFeatures = extractFeatures(sceneImage,scenePoints); 
boxPairs = matchFeatures(boxFeatures, sceneFeatures);


% 显示假定匹配的特征
matchedBoxPoints = boxPoints(boxPairs(:, 1), :);
matchedScenePoints = scenePoints(boxPairs(:, 2), :);
figure;
showMatchedFeatures(wahaha, sceneImage, matchedBoxPoints, ...
    matchedScenePoints, 'montage');
title('Putatively Matched Points (Including Outliers)');

% 使用场景中假定匹配定位物体
[tform, inlierBoxPoints, inlierScenePoints] = ...
    estimateGeometricTransform(matchedBoxPoints, matchedScenePoints, 'affine');
 
figure;
showMatchedFeatures(wahaha, sceneImage, inlierBoxPoints, ...
    inlierScenePoints, 'montage');
title('Matched Points (Inliers Only)');
 
 
% 绘制定位框
boxPolygon = [1, 1;...                           % top-left
        size(wahaha, 2), 1;...                 % top-right
        size(wahaha, 2), size(wahaha, 1);... % bottom-right
        1, size(wahaha, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon
 
newBoxPolygon = transformPointsForward(tform, boxPolygon);    
 
figure;
imshow(sceneImage);
hold on;
line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
title('Detected Box');


% % 检测另外一个目标
% cup1Image = imread('cup.jpg');
% cupImage=rgb2gray(cup1Image);
%  
% cupPoints = detectSURFFeatures(cupImage);
% figure;
% imshow(cupImage);
% hold on;
% plot(selectStrongest(cupPoints, 100));
% title('100 Strongest Feature Points from cup Image');
%  
% % Extract feature descriptors.
% [cupFeatures, cupPoints] = extractFeatures(cupImage, cupPoints);
%  
% % Match Features
% cupPairs = matchFeatures(cupFeatures, sceneFeatures, 'MaxRatio', 0.9);
%  
% % Display putatively matched features.
% matchedcupPoints = cupPoints(cupPairs(:, 1), :);
% matchedScenePoints = scenePoints(cupPairs(:, 2), :);
% figure;
% showMatchedFeatures(cupImage, sceneImage, matchedcupPoints, ...
%     matchedScenePoints, 'montage');
% title('Putatively Matched Points (Including Outliers)');
%  
% % Estimate Geometric Transformation and Eliminate Outliers
% [tform, inlierElephantPoints, inlierScenePoints] = ...
%     estimateGeometricTransform(matchedcupPoints, matchedScenePoints, 'affine');
% figure;
% showMatchedFeatures(cupImage, sceneImage, inlierElephantPoints, ...
%     inlierScenePoints, 'montage');
% title('Matched Points (Inliers Only)');
%  
% % Display Both Objects
% cupPolygon = [1, 1;...                                 % top-left
%         size(cupImage, 2), 1;...                       % top-right
%         size(cupImage, 2), size(cupImage, 1);...  % bottom-right
%         1, size(cupImage, 1);...                       % bottom-left
%         1,1];                         % top-left again to close the polygon
%  
% newcupPolygon = transformPointsForward(tform, cupPolygon);    
%  
% figure;
% imshow(sceneImage);
% hold on;
% line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
% line(newcupPolygon(:, 1), newcupPolygon(:, 2), 'Color', 'g');
% title('Detected cup and Box');
%  
% displayEndOfDemoMessage(mfilename)