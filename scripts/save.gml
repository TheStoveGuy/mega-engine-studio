//save(0,0);
//This script is pretty much a shortcut for 4 different functions

var va,file,fl;
va = 0;

if !argument0
{
    if saveload = "save" //add value to list
    {
        ds_list_add(savelist,argument1);
    }
    if saveload = "load" //get value from list
    {
        va = ds_list_find_value(savelist,0)
        ds_list_delete(savelist,0);
        return(va);
    }
}
else
{
    if argument1 <= 0
    {
        file = "main.sav";
    }
    else
    {
        file = "save"+string(argument1)+".sav";
    }
    
    if saveload = "save" //write a file using the list
    {
        fl = file_text_open_write(file);
        va = ds_list_write(savelist);
        file_text_write_string(fl,va);
        file_text_close(fl);
        
        objGlobalControl.saveTimer = 40;
    }
    if saveload = "load" //load list from file
    {
        if !file_exists(file)
        {
            return(false);
        }
        else
        {
            fl = file_text_open_read(file);
            va = file_text_read_string(fl);
            ds_list_read(savelist,va);
            file_text_close(fl);
            return(true);
        }
    }
}
