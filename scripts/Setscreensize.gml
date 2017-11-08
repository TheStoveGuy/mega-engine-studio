//Setscreensize()
//argument0: screen size

var s,w,h,xsize,ysize;
s = argument0;

xsize = 256;
ysize = 224;
full = 0;

if (display_get_height() < s*ysize or display_get_width() < s*xsize)
{
    var hs,ws;
    hs = display_get_height()/ysize;
    ws = display_get_width()/xsize;
    if hs > ws {hs = ws;}
    else if hs < ws {ws = hs;}
    s = hs;
    //full = 1;
}
s = max(1,s);

window_set_fullscreen(full);

if !full
{
    w = xsize*floor(s);
    h = ysize*floor(s);
    window_set_size(w,h);
    
    window_set_position(
        floor(display_get_width()/2-w/2),
        floor(display_get_height()/2-h/2)
    );
}

global.screensize = ceil(s);
