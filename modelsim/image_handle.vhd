-------------------------------------------------------------------------------
-- Alberto Santos
-- Image manipulation:
-- This package contains all the necessary functions that will be used 
--   to read and manipulate images.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

package image_handle is
	
	constant IMAGE_WIDTH		: natural := 64;
	constant IMAGE_HEIGHT 	: natural := 48;
	constant PICTURE_SIZE	: natural := image_width * image_height;
	type picture_array	is array (0 to PICTURE_SIZE) of integer range 0 to 255;

	procedure open_image(filename: in string; signal total_vector: out picture_array);
end image_handle;

package body image_handle is

procedure open_image(filename: in string; signal total_vector: out picture_array) is

	variable input_line     : line;
	variable data_read		: integer;
	variable index				: natural :=0;
	file input_file         : text;
	
	--writing portion of the definitions
	variable output_line		: line;
	variable data_out			: integer;
	file output_file			: text;
	constant output_filename: string := "C:\Users\BertoTech\Documents\myProject\myProject\project files\endpic.bmp";
	
	
begin
	file_open(input_file,filename,READ_MODE);
	file_open(output_file, output_filename, WRITE_MODE);
	
	while not endfile(input_file) loop
		readline(input_file, input_line);
		read(input_line, data_read);
		
		total_vector(index) 	<= data_read;
		index 					:= index +1;
		
		-- writing portion:
		write(output_line, data_read);
      writeline(output_file,output_line);
		
	end loop;

file_close(input_file);
file_close(output_file);
	 
end open_image;



end package body;