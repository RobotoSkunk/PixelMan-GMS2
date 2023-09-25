/// @description fast_string_key_crypt(input_file, is_encrypted, encryption_key_string);
/// @param input_string
/// @param is_encrypted
/// @param encryption_key_string

var data, string_in, pos, len, xor_shift, bit_shift, shift_direction, enc_key, key_hash, key_hash2, key_pos, key_len;

string_in = argument0;
key_pos = 0;
pos = 0;
bit_shift = 128;
xor_shift = 1;

enc_key = argument2;

key_hash = md5_string_unicode(enc_key)+sha1_string_unicode(enc_key)+md5_string_utf8(enc_key)+sha1_string_utf8(enc_key);
key_hash2 = md5_string_unicode(key_hash)+sha1_string_unicode(key_hash)+md5_string_utf8(key_hash)+sha1_string_utf8(key_hash);
key_hash = key_hash + key_hash2;
key_len = string_length(key_hash) div 2;

if argument1 == true shift_direction = 1;
else shift_direction = -1;

var key_arr;
for (var i=0; i<key_len; i++){
    key_arr[i] = hex_to_dec_fast(string_copy(key_hash, (i*2)+1, 2));
}

xor_shift = xor_shift mod 10;

//var string_buffer = buffer_load(string_in);
var string_buffer = buffer_create(string_byte_length(string_in), buffer_grow, 1);
buffer_write(string_buffer, buffer_string, string_in);
len = buffer_get_size(string_buffer);
buffer_seek(string_buffer, buffer_seek_start, pos);

while(pos != len){
	switch (shift_direction){
		case 1:
			data = ((((buffer_read(string_buffer, buffer_u8) + bit_shift + key_arr[key_pos]) mod 256) ^ xor_shift) ^ key_arr[key_pos]);
			break;
		case -1:
			data = (((buffer_read(string_buffer, buffer_u8)  ^ xor_shift) ^ key_arr[key_pos]) + bit_shift - key_arr[key_pos]) mod 256;
			break;
   }
	
	xor_shift += 1;
	
	if (xor_shift > 5000){ 
		xor_shift = 1;
		
		key_hash = md5_string_unicode(key_hash2)+sha1_string_unicode(key_hash2)+md5_string_utf8(key_hash2)+sha1_string_utf8(key_hash2);
		key_hash2 = md5_string_unicode(key_hash)+sha1_string_unicode(key_hash)+md5_string_utf8(key_hash)+sha1_string_utf8(key_hash);
		key_hash = key_hash + key_hash2;
		
		for (var i=0; i<key_len; i++){
			key_arr[i] = hex_to_dec_fast(string_copy(key_hash, (i*2)+1, 2));
		}
	}
	
	bit_shift += shift_direction * (key_arr[(key_len-1)-key_pos] mod 2);
	if bit_shift > 255 bit_shift = 1;
	else if bit_shift < 1 bit_shift = 255;
	
	key_pos += 1;
	if key_pos > (key_len-1) key_pos = 0; 
	
	buffer_seek(string_buffer, buffer_seek_start, pos);
	buffer_write(string_buffer, buffer_u8, data);
	pos = buffer_tell(string_buffer);
	
}

var rtrn = buffer_base64_encode(string_buffer, 0, buffer_get_size(string_buffer));
buffer_delete(string_buffer);

return base64_decode(rtrn);
