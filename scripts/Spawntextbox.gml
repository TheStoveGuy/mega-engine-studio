//textbox()
//argument0: 0 at the top; 1 in the middel; 2 at the bottom
//argument1: what event 'event_user(x)' it triggers after closing it
//argument2: name;
//argument3-15: the text that should be displayed, place after the last argument you need a -1

var i,box_y,checkarguments,ca;
    
//spawn textbox
i = instance_create(x,y,objTextbox)

//set y-position
switch (argument[0]) {
    case 0: i.boxy = 32; break;
    case 1: i.boxy = 112; break;
    case 2: i.boxy = 192; break;
}
i.origin = id;
i.o_event = argument[1];
i.name = argument[2];

//insert text
for (ca=3; ca<=15; ca+=1)
{
    if !is_string(argument[ca]) {exit;}
    ds_list_add(i.text,argument[ca]);
}
