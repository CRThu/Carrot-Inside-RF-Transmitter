% Override Y-Axis Labels
% BUGS:CANNOT UPDATE WHEN ZOOM
function OverrideYLabel(src,callbackdata)
    for gca_i=1:2
        gca_current=src.Children(gca_i);
        yticks('auto') 
        y_string = '%d';
        ytick = get(gca_current, 'ytick');
        yticklabel = cell(1,length(ytick));
        for i = 1:length(ytick)
            yticklabel{i} = sprintf(y_string, ytick(i));
        end
        set(gca_current, 'yticklabel', yticklabel);
        
        fprintf('GUI AXES %d Updated.\n',gca_i);
    end
end