function test_layer_ce
% to check the gradiant of bias
% lichao, 20160830

%% parameters
p.le_tol = 1e-11;
p.ge_tol = 1e-16;
p.epsilon = 1e-7;
p.iterations = 1;
p.verbose = 'true';
p.add_linear = 'true';

input_dim = 10;
output_dim = input_dim;
mini_batch = 20;

%% input and labels
% x = single(randn(input_dim, mini_batch));
% y = single(randn(output_dim, mini_batch));
x = randn(input_dim, mini_batch);

% Make one-hot vectors (Cross Entropy)
y_onehot = zeros(output_dim, mini_batch);

for i = 1: mini_batch
    idx = randi(output_dim);
    y_onehot(idx, i) = 1.0;
end

%% build layer

ce_cost_conf.indim = input_dim;
ce_cost_conf.outdim = output_dim;
ce_cost_model = ce_cost_set(ce_cost_conf);
ce_cost_model = ce_cost_initial(ce_cost_model);

%% check grand
check_grad_with_dummy(ce_cost_model, x, y_onehot,p);



