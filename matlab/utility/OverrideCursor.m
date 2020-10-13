% Override Cursor in figure
function OverrideCursor(f)
    dcm_obj = datacursormode(f);
    set(dcm_obj,'UpdateFcn',@OverrideCursorCallback)
end