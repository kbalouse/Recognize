% Input: 48x48x3

face_identification_nn.layers = {};

%Conv layer 1: filterdim = 3x3, num_filters = 32, stride=1, pad=2
face_identification_nn.layers{end + 1} = ...
struct( ...
'type', 'conv', ...
'weights', {{initW * randn(5, 5, 3, 32, 'single'), initB*randn(1, 32, 'single')}}, ...
'stride', 1, ...
'pad', 2);

%RELU
face_identification_nn.layers{end + 1} = struct('type', 'relu');

%Conv layer 2: filterdim = 3x3, num_filters = 32, stride=1, pad=2
face_identification_nn.layers{end + 1} = ...
struct( ...
'type', 'conv', ...
'weights', {{initW * randn(5, 5, 32, 32, 'single'), initB*randn(1, 32, 'single')}}, ...
'stride', 1, ...
'pad', 2);

%RELU
face_identification_nn.layers{end + 1} = struct('type', 'relu');

%MaxPool: dim 3x3, stride=2, pad=1
face_identification_nn.layers{end + 1} = ...
struct(...
'type', 'pool', ...
'method', 'max', ...
'pool', [3 3], 'stride', 2, 'pad', 1);

%Conv layer 3: filterdim = 3x3, num_filters = 64, stride=1, pad=2
face_identification_nn.layers{end + 1} = ...
struct( ...
'type', 'conv', ...
'weights', {{initW * randn(5, 5, 32, 64, 'single'), initB*randn(1, 64, 'single')}}, ...
'stride', 1, ...
'pad', 2);

%RELU
face_identification_nn.layers{end + 1} = struct('type', 'relu');

%Conv layer 4: filterdim = 3x3, num_filters = 64, stride=1, pad=2
face_identification_nn.layers{end + 1} = ...
struct( ...
'type', 'conv', ...
'weights', {{initW * randn(5, 5, 64, 64, 'single'), initB*randn(1, 64, 'single')}}, ...
'stride', 1, ...
'pad', 2);

%RELU
face_identification_nn.layers{end + 1} = struct('type', 'relu');

%MaxPool: dim 3x3, stride=2, pad=1
face_identification_nn.layers{end + 1} = ...
struct(...
'type', 'pool', ...
'method', 'max', ...
'pool', [3 3], 'stride', 2, 'pad', 1);

%Conv layer 5: filterdim = 3x3, num_filters = 64, stride=1, pad=2
face_identification_nn.layers{end + 1} = ...
struct( ...
'type', 'conv', ...
'weights', {{initW * randn(5, 5, 64, 64, 'single'), initB*randn(1, 64, 'single')}}, ...
'stride', 1, ...
'pad', 2);

%RELU
face_identification_nn.layers{end + 1} = struct('type', 'relu');

%Conv layer 6: filterdim = 3x3, num_filters = 64, stride=1, pad=2
face_identification_nn.layers{end + 1} = ...
struct( ...
'type', 'conv', ...
'weights', {{initW * randn(5, 5, 64, 64, 'single'), initB*randn(1, 64, 'single')}}, ...
'stride', 1, ...
'pad', 2);

%RELU
face_identification_nn.layers{end + 1} = struct('type', 'relu');

%MaxPool: dim 3x3, stride=2, pad=1
face_identification_nn.layers{end + 1} = ...
struct(...
'type', 'pool', ...
'method', 'max', ...
'pool', [3 3], 'stride', 2, 'pad', 1);

%Conv layer 7: filterdim = 6x6, num_filters = 4096, stride=1, pad=0
face_identification_nn.layers{end + 1} = ...
struct( ...
'type', 'conv', ...
'weights', {{initW * randn(6, 6, 64, 4096, 'single'), initB*randn(1, 4096, 'single')}}, ...
'stride', 1, ...
'pad', 0);

%RELU
face_identification_nn.layers{end + 1} = struct('type', 'relu');

%Conv layer 8: filterdim = 1x1, num_filters = 200, stride=1, pad=0
face_identification_nn.layers{end + 1} = ...
struct( ...
'type', 'conv', ...
'weights', {{initW * randn(1, 1, 4096, 200, 'single'), initB*randn(1, 200, 'single')}}, ...
'stride', 1, ...
'pad', 0);

% Softmax with log loss
face_identification_nn.layers{end + 1} = struct('type', 'softmaxloss');


