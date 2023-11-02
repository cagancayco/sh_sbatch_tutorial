%% Clear the environment

clear; clc; clf; close('all')

%% List files in image directory
cd images
image_dir = dir;
image_dir = image_dir(3:end);

%% Perform cell detection for each image

for i = 1:length(image_dir)
    % Load image
    I = imread(image_dir(i).name);

    % Show image
    imshow(I)

    % Pause for 2.5 seconds (demonstration purposes only)
    pause(2.5)

    % Find cells/circles
    [centers,radii] = imfindcircles(I,[20 25],"ObjectPolarity","dark", "Sensitivity",0.98, "EdgeThreshold", 0.1);

    % Draw circles/ROIs on image
    h = viscircles(centers,radii);

    % Pause for 2.5 seconds (demonstration purposes only)
    pause(2.5)

    % Get image with ROIs
    F = getframe;

    % Save image
    if i < 10
        imwrite(F.cdata, strcat('rois0',num2str(i),'.png'));
    else
        imwrite(F.cdata, strcat('rois',num2str(i),'.png'));
    end
end

cd ..
