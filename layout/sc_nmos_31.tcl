##Initiaze pointer##
set x 0
set y 0
box position $x $y

##Nmos layout starts here##
#Create poly-strips#
set sc_poly_width 100
set sc_poly_height 402
set sc_box_position_x [expr $x+225]
set sc_box_position_y [expr $y+550]
box position $sc_box_position_x $sc_box_position_y
box size $sc_poly_width $sc_poly_height
paint poly

#Create mvndiffusion area#
set sc_mvndiff_width 170
set sc_mvndiff_height 300
set sc_mvndiff_spacing 127
set sc_box_position_x [expr $x+190]
set sc_box_position_y [expr $y+601]
box position $sc_box_position_x $sc_box_position_y 
box size $sc_mvndiff_width $sc_mvndiff_height
paint mvndiff

#Create local interconnect layer#
#For source and drain terminals#
set sc_li_width 17 
set sc_li_height 300
set sc_mos_terminals 2
set sc_box_position_x [expr $x+199]
set sc_box_position_y [expr $y+601]
set sc_li_spacing_x 135
set sc_li_spacing_y 127
for {set i 1} {$i <= $sc_mos_terminals} {incr i} {
	box position $sc_box_position_x $sc_box_position_y
	box size $sc_li_width $sc_li_height
	paint li
	set sc_box_position_x [expr $sc_box_position_x+$sc_li_spacing_x]
} 

#Create ndiffusioncontact area#
set sc_mvndc_width 17 
set sc_mvndc_height 91
set sc_mos_terminals 2
set sc_mos_spacing 127
set sc_box_position_x [expr $x+199]
set sc_box_position_y [expr $y+610]
set sc_mvndc_spacing_x 135
set sc_mvndc_spacing_y 100
for {set j 1} {$j <= $sc_mos_terminals} {incr j} {
	for {set i 1} {$i <= $sc_mos_terminals} {incr i} {
		box position $sc_box_position_x $sc_box_position_y
		box size $sc_mvndc_width $sc_mvndc_height
		paint mvndcontact
		set sc_box_position_y [expr $sc_box_position_y+$sc_mvndc_spacing_y+$sc_mvndc_height]
		}
	set sc_box_position_x [expr $sc_box_position_x+$sc_mvndc_spacing_x]
	set sc_box_position_y [expr $y+610]
} 

