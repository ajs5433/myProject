LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.image_handle.all;

entity image_test is
end image_test;

architecture beh of image_test is
signal myarray		: picture_array;
signal done_flag	: std_logic := '0' ;
begin

process is
begin

open_image("C:\Users\BertoTech\Documents\myProject\myProject\project files\rit2.bmp", myarray);
wait for 20ns;
done_flag <= '1';
wait;
end process;	
end beh;  