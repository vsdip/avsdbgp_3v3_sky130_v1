##Initiaze pointer##
set x 0
set y 0
box position $x $y

##Nmos layout starts here##
#Create poly-strips#
set sc_poly_width 600
set sc_poly_height 4302
set sc_box_position_x [expr $x+225]
set sc_box_position_y [expr $y+550]
box position $sc_box_position_x $sc_box_position_y
box size $sc_poly_width $sc_poly_height
paint poly

#Create mvndiffusion area#
set sc_mvndiff_width 670
set sc_mvndiff_height 4200
set sc_mvndiff_spacing 627
set sc_box_position_x [expr $x+190]
set sc_box_position_y [expr $y+601]
box position $sc_box_position_x $sc_box_position_y 
box size $sc_mvndiff_width $sc_mvndiff_height
paint mvndiff

#Create local interconnect layer#
#For source and drain terminals#
set sc_li_width 17 
set sc_li_height 4200
set sc_mos_terminals 2
set sc_box_position_x [expr $x+199]
set sc_box_position_y [expr $y+601]
set sc_li_spacing_x 635
set sc_li_spacing_y 627
for {set i 1} {$i <= $sc_mos_terminals} {incr i} {
	box position $sc_box_position_x $sc_box_position_y
	box size $sc_li_width $sc_li_height
	paint li
	set sc_box_position_x [expr $sc_box_position_x+$sc_li_spacing_x]
} 

#Create ndiffusioncontact area#
set sc_mvndc_width 17 
set sc_mvndc_height 100
set sc_mos_terminals 2
set sc_mos_spacing 627
set sc_box_position_x [expr $x+199]
set sc_box_position_y [expr $y+610]
set sc_mvndc_spacing_x 635
set sc_mvndc_spacing_y 20
for {set j 1} {$j <= $sc_mos_terminals} {incr j} {
	for {set i 1} {$i <= [expr 4200/120]} {incr i} {
		box position $sc_box_position_x $sc_box_position_y
		box size $sc_mvndc_width $sc_mvndc_height
		paint mvndcontact
		set sc_box_position_y [expr $sc_box_position_y+$sc_mvndc_spacing_y+$sc_mvndc_height]
		}
	set sc_box_position_x [expr $sc_box_position_x+$sc_mvndc_spacing_x]
	set sc_box_position_y [expr $y+610]
} 
