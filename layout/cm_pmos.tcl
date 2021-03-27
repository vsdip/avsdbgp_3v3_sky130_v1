##Initiaze pointer##
set x 0
set y 0
box position $x $y

##current mirror circuit layout##
##all related variables start with 'cm'##
##pmos layout starts here##
#Create poly-strips#
set cm_poly_width 500
set cm_poly_height 2050
set cm_box_position_x $x
set cm_box_position_y $y
box position $cm_box_position_x $cm_box_position_y
box size $cm_poly_width $cm_poly_height
paint poly

#Create mvpdiff area#
set cm_mvpdiff_width 570
set cm_mvpdiff_height 1500
set cm_box_position_x [expr $x-35]
set cm_box_position_y [expr $y+25]
box position $cm_box_position_x $cm_box_position_y
box size $cm_mvpdiff_width $cm_mvpdiff_height
paint mvpdiffusion

#Create local interconnect layer#
#For pmos  source and drain terminals#
set cm_li_width 17
set cm_li_height 1500
set cm_number_of_li 2
set cm_box_position_x [expr $x-26]
set cm_box_position_y [expr $y+25]
set cm_li_spacing_x 535
for {set i 1} {$i <= $cm_number_of_li} {incr i} {
	box position $cm_box_position_x $cm_box_position_y
	box size $cm_li_width $cm_li_height
	paint li
	set cm_box_position_x [expr $cm_box_position_x+$cm_li_spacing_x]
} 

#Create pdiffusioncontact area#
#Pdiffusioncontact starts here#
#Contacts for source and drain#
set cm_mvpdc_width 17
set cm_mvpdc_height 100
set cm_mos_terminals 2
set cm_num_of_mvpdc 12
set cm_box_position_x [expr $x-26]
set cm_box_position_y [expr $y+65]
set cm_mos_term_space_x 535
set cm_mvpdc_space_y 20
for {set j 1} {$j <= $cm_mos_terminals} {incr j} { 
	for {set i 1} {$i <= $cm_num_of_mvpdc} {incr i} {
		box position $cm_box_position_x $cm_box_position_y
		box size $cm_mvpdc_width $cm_mvpdc_height
		paint mvpdcontact
		set cm_box_position_y [expr $cm_box_position_y+$cm_mvpdc_space_y+$cm_mvpdc_height]
	} 
	set cm_box_position_x [expr $cm_box_position_x+$cm_mos_term_space_x]
	set cm_box_position_y [expr $y+65]
} 

#Pdiffusioncontact ends here#

#Create n-well area#
set cm_nw_width 636
set cm_nw_height 2060
set cm_box_position_x [expr $x-68]
set cm_box_position_y [expr $y-10]
box position $cm_box_position_x $cm_box_position_y
box size $cm_nw_width $cm_nw_height
paint nwell

##Pmos layout ends here##
