function filter_coe_writer(filename,coe_width,coe_vec)
    fid = fopen(filename,'w');
    fprintf(fid,'Radix = 10;\n');
    fprintf(fid,'Coefficient_Width = %d;\n',coe_width);
    fprintf(fid,'CoefData = ');
    for i = 1:length(coe_vec)
        fprintf(fid,'%.18f',coe_vec(i));
        if i==length(coe_vec)
            fprintf(fid,';');
        else
            fprintf(fid,',\n');
        end
    end
    fclose(fid);
end