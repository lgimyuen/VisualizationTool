function [ imVisualize ] = visualizeDetectionResult( im, detectionHeatMap, castType )
%VISUALIZEDETECTIONRESULT Summary of this function goes here
%   Detailed explanation goes here

im = double(im);
detectionHeatMap = double(detectionHeatMap);

%scale the detectionHeatMap to 0 to 1
detectionHeatMap = detectionHeatMap + abs( min (min(detectionHeatMap)));
detectionHeatMap = detectionHeatMap / max(max(detectionHeatMap));


%log the heatMap to make it more significant
detectionHeatMap = 10*log(detectionHeatMap+1)+1;

imVisualize = zeros(size(im,1), size(im,2),3);

if size(im,3) > 1
    imVisualize(:,:,1) = detectionHeatMap .* im(:,:,1);
    imVisualize(:,:,2) = im(:,:,2);
    imVisualize(:,:,3) = im(:,:,3);
else
    imVisualize(:,:,1) = detectionHeatMap .* im(:,:,1);
    imVisualize(:,:,2) = im(:,:);
    imVisualize(:,:,3) = im(:,:);
end

eval([' castHandler = @' castType ';']);
figure, imagesc(castHandler(imVisualize)), axis image;

end

