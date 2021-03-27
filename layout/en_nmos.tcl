##Initiaze pointer##
set x 0
set y 0
box position $x $y

##current mirror circuit layout##
##all related variables start with 'en'##
##nmos layout starts here##
#Create poly-strips#
set cm_poly_width 500
set cm_poly_height 1750
set cm_box_position_x $x
set cm_box_position_y $y
box position $cm_box_position_x $cm_box_position_y
box size $cm_poly_width $cm_poly_height
paint poly

#Create mvndiff area#
set cm_mvndiff_width 570
set cm_mvndiff_height 1200
set cm_box_position_x [expr $x-35]
set cm_box_position_y [expr $y+25]
box position $cm_box_position_x $cm_box_position_y
box size $cm_mvndiff_width $cm_mvndiff_height
paint mvndiffusion

#Create local interconnect layer#
#For nmos  source and drain terminals#
set cm_li_width 17
set cm_li_height 1200
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
#Ndiffusioncontact starts here#
#Contacts for source and drain#
set cm_mvndc_width 17
set cm_mvndc_height 100
set cm_mos_terminals 2
set cm_num_of_mvndc 10
set cm_box_position_x [expr $x-26]
set cm_box_position_y [expr $y+35]
set cm_mos_term_space_x 535
set cm_mvndc_space_y 20
for {set j 1} {$j <= $cm_mos_terminals} {incr j} { 
	for {set i 1} {$i <= $cm_num_of_mvndc} {incr i} {
		box position $cm_box_position_x $cm_box_position_y
		box size $cm_mvndc_width $cm_mvndc_height
		paint mvndcontact
		set cm_box_position_y [expr $cm_box_position_y+$cm_mvndc_space_y+$cm_mvndc_height]
	} 
	set cm_box_position_x [expr $cm_box_position_x+$cm_mos_term_space_x]
	set cm_box_position_y [expr $y+35]
} 

#Ndiffusioncontact ends here#
##Nmos layout ends here##
