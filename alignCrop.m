function outputImage = alignCrop(imageName, model, Model3D, eyemask, REFTFORM, REFSZ)
% Load query image
I_Q = imread(imageName);

fidu_XY = FacialFeatureDetection(I_Q, model);
if isempty(fidu_XY)
    %error('Failed to detect facial features / find face in image.');
    fprintf('Failed to detect facial features on the image:');
    fprintf(imageName);
    fprintf(' Skipping image...\n');
    outputImage = [];
    return;
end

% Estimate projection matrix C_Q
[C_Q, ~,~,~] = estimateCamera(Model3D, fidu_XY);

% Render frontal view
[frontal_sym, frontal_raw] = Frontalize(C_Q, I_Q, Model3D.refU, eyemask);


% Apply similarity transform to LFW-a coordinate system, for compatability
% with existing methods and results
frontal_sym = imtransform(frontal_sym,REFTFORM,'XData',[1 REFSZ(2)], 'YData',[1 REFSZ(1)]);
%frontal_raw = imtransform(frontal_raw,REFTFORM,'XData',[1 REFSZ(2)], 'YData',[1 REFSZ(1)]);

fidu_XY = FacialFeatureDetection(frontal_sym, model);
if isempty(fidu_XY)
    fprintf('Failed to detect facial features on the image:');
    fprintf(imageName);
    fprintf(' Skipping image...\n');
    outputImage = [];
    return;
end

outputImage = imcrop(frontal_sym, [min(fidu_XY(:,1)) min(fidu_XY(:,2)) max(fidu_XY(:,1))-min(fidu_XY(:,1)) max(fidu_XY(:,2))-min(fidu_XY(:,2))]);
end