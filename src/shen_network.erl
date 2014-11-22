-module (shen_network).
-export ([start/2]).



% NetworkArchitecture is a list of Hidden Layer Dimensions. 
start(DataInfo, NetworkArchitecture) -> 

	{TrainSet, TestSet} = shen_parse:get_data(DataInfo),

	Network = [[spawn(neuron, start, [length(TrainSet)]) || X <- lists:seq(Dimension)] || Dimension <- NetworkArchitecture],

	lists:foldl(fun(Layer, LayerAfter) -> lists:map(fun(Neuron) -> Neuron ! LayerAfter end), Layer end, [], Network),
	lists:foldr(fun(Layer, LayerBefore) -> lists:map(fun(Neuron) -> Neuron ! LayerBefore end), Layer end, Layer, Network).

	until convergence:

		send the fist layer of neurons the first input




	% Make a first and last layer. 

	% First Layer
	% Find the dimensionality of the training data. 
	% Send appropriate Pids. 

	% Last layer
	% Find the dimenionality of the labels. 
	% Send the last hidden layer these Pids, and send these Pids the Layerbefore. 



% learn
    % send data to input layer


% bias units?


