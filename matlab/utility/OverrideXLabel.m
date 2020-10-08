% Override X-Axis Labels
function OverrideXLabel(src,callbackdata)
    for gca_i=1:length(src.Children)
        gca_current=src.Children(gca_i);
        xticks('auto') 
        x_string = '%d';
        xtick = get(gca_current, 'xtick');
        xticklabel = cell(1,length(xtick));
        for i = 1:length(xtick)
            xticklabel{i} = sprintf(x_string, xtick(i));
        end
        set(gca_current, 'xticklabel', xticklabel);
        
        %disp(callbackdata)
        %fprintf('GUI AXES %d Updated.\n',gca_i);
    end
end