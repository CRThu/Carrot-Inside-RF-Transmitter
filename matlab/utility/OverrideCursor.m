% Override Cursor in figure
function OverrideCursor()
    dcm_obj = datacursormode(gcf);
    set(dcm_obj,'UpdateFcn',@OverrideCursorCallback)
end