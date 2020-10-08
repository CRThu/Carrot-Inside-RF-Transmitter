% Override X-Axis Labels
% BUGS:CANNOT UPDATE WHEN ZOOM
function OverrideXLabel(varargin)
    narginchk(0,1);
    if nargin == 0
        x_string = '%d';
    else
        x_string = varargin{1};
    end
    
    xtick = get(gca, 'xtick');
    xticklabel = cell(1,length(xtick));
    for i = 1:length(xtick)
        xticklabel{i} = sprintf(x_string, xtick(i));
    end
    set(gca, 'xticklabel', xticklabel)
end