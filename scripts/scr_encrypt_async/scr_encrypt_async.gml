///@func encrypt_async(string, encrypt, blowfish);
///@param string {string}
///@param encrypt {bool}
///@param blowfish {string}

var str, enc, blowfish;
str = argument0;
enc = argument1;
blowfish = argument2;

var new_inst = instance_create_depth(x, y, -1, obj_encrypt_async);
with(new_inst){
	string_in = str;
	encrypt = enc;
	enc_key = blowfish;
	obj_id = other.id;
}

async_encrypt = ds_map_create();
async_encrypt[? "id"] = new_inst;
async_encrypt[? "status"] = "Waiting...";
async_encrypt[? "output"] = "";
