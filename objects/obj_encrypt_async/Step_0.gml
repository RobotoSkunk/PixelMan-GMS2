/// @description CPU
#region Alarmas
for(var i = 0; i < 10; i++){
	if(timer[i] > 0){
		timer[i]--;
		if(timer[i] <= 0){
			switch(i){
				#region Alarm 0 | Iniciar encripción
				case 0:
					key_pos = 0;
					pos = 0;
					bit_shift = 128;
					xor_shift = 1;
					
					key_hash = md5_string_unicode(enc_key)+sha1_string_unicode(enc_key)+md5_string_utf8(enc_key)+sha1_string_utf8(enc_key);
					key_hash2 = md5_string_unicode(key_hash)+sha1_string_unicode(key_hash)+md5_string_utf8(key_hash)+sha1_string_utf8(key_hash);
					key_hash = key_hash + key_hash2;
					key_len = string_length(key_hash) div 2;
					
					if (encrypt) {shift_direction = 1;}
					else {shift_direction = -1;}
					
					for(var i = 0; i < key_len; i++){
						key_arr[i] = hex_to_dec_fast(string_copy(key_hash, (i*2)+1, 2));
					}
					
					xor_shift = xor_shift % 10;
					
					string_buffer = buffer_create(string_byte_length(string_in), buffer_grow, 1);
					buffer_write(string_buffer, buffer_string, string_in);
					len = buffer_get_size(string_buffer);
					buffer_seek(string_buffer, buffer_seek_start, pos);
					
					timer[1] = 2;
					break;
					#endregion
				#region Alarm 1 | Encriptar / desencriptar
				case 1:
					var loop = true;
					for(var eni = 0; eni < 500*force_cpu; eni++){
						if(pos != len){
							switch(shift_direction){
								case 1: data = ((((buffer_read(string_buffer, buffer_u8) + bit_shift + key_arr[key_pos]) % 256) ^ xor_shift) ^ key_arr[key_pos]) break;
								case -1: data = (((buffer_read(string_buffer, buffer_u8)  ^ xor_shift) ^ key_arr[key_pos]) + bit_shift - key_arr[key_pos]) % 256; break;
						   }
							xor_shift++;
							
							if (xor_shift > 5000){ 
								xor_shift = 1;
							
								key_hash = md5_string_unicode(key_hash2)+sha1_string_unicode(key_hash2)+md5_string_utf8(key_hash2)+sha1_string_utf8(key_hash2);
								key_hash2 = md5_string_unicode(key_hash)+sha1_string_unicode(key_hash)+md5_string_utf8(key_hash)+sha1_string_utf8(key_hash);
								key_hash = key_hash + key_hash2;
							
								for (var i = 0; i < key_len; i++){
									key_arr[i] = hex_to_dec_fast(string_copy(key_hash, (i*2)+1, 2));
								}
							}
						
							bit_shift -= (key_arr[(key_len-1)-key_pos] % 2);
							if(bit_shift > 255) {bit_shift = 1;}
							else if(bit_shift < 1) {bit_shift = 255;}
						
							key_pos += 1;
							if(key_pos > (key_len-1)) {key_pos = 0;}
						
							buffer_seek(string_buffer, buffer_seek_start, pos);
							buffer_write(string_buffer, buffer_u8, data);
							pos = buffer_tell(string_buffer);
							
							count++;
							obj_id.async_encrypt[? "status"] = string(round(count/len)) + "%";
						} else {
							buffer_seek(string_buffer, buffer_seek_start, 0);
							var rtrn = buffer_read(string_buffer, buffer_string);
							buffer_delete(string_buffer);
							
							//show_debug_message(rtrn);
							obj_id.async_encrypt[? "output"] = rtrn;
							instance_destroy();
							loop = false;
							break;
						}
					}
					if loop timer[1] = 1;
					break;
					#endregion
				
}
		}
	}
}
#endregion
