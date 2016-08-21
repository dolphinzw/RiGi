function bias_model = bias_set(conf,bias_model)
% used to set paramters of linear model
% input :
%       conf: the struct configure
%       lstmp: the model
%
% lichao 20160718


%conf = struct('type', 'l', 'need_act_h', 1,'clip_gradient',clip_gradient);
if nargin < 2
    bias_model = [];
end
bias_model.indim = conf.indim;
bias_model.outdim = conf.indim;

%%
if isfield(conf,'name')
    bias_model.name = conf.name;
else
    bias_model.name = 'none';
end

if isfield(conf,'need_convert_dim')
    bias_model.need_convert_dim = conf.need_convert_dim;
else
    bias_model.need_convert_dim = 'false';
end

if isfield(conf,'axis_to_norm')
    bias_model.axis_to_norm = conf.axis_to_norm;
else
    bias_model.axis_to_norm = 0;
end

if isfield(conf,'inmap_size')
    bias_model.inmap_size = conf.inmap_size;
else
    bias_model.inmap_size = [conf.indim, 1];
end

if isfield(conf,'inmaps_num')
    bias_model.inmaps_num = conf.inmaps_num;
else
    bias_model.inmaps_num = 1;
end
