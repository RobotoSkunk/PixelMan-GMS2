/// ds_list_add_map(id,map)
///@param id
///@param map
{
    var parent, map, pos;
    parent = argument0;
    map = argument1;
    pos = ds_list_size(parent);
    ds_list_add(parent, map);
    ds_list_mark_as_map(parent, pos);
}