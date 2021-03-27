##Initiaze pointer##
set x 0
set y 0
box position $x $y

##all related variables start with 'sc'##
##pmos layout starts here##
#Create poly-strips#
set sc_poly_width 150
set sc_poly_height 6000
box position [expr $x+200] [expr $y+1532]
box size $sc_poly_width $sc_poly_height
paint poly

#Create mvpdiff area#
set sc_mvpdiff_width 50
set sc_mvpdiff_height 6070
box position [expr $x+250] [expr $y+1497]
box size $sc_mvpdiff_width $sc_mvpdiff_height
paint mvpdiffusion

#Create local interconnect layer#
#Local interconnect layer starts here#
#For source and drain terminals#
set sc_li_width 50
set sc_li_height 17
set sc_number_of_li 2
set sc_box_position_x [expr $x+250]
set sc_box_position_y [expr $y+1506]
set sc_box_spacing 6035
for {set i 1} {$i <= $sc_number_of_li} {incr i} {
	box position $sc_box_position_x $sc_box_position_y 
	box size $sc_li_width $sc_li_height
	paint li
	set sc_box_position_y [expr $sc_box_position_y+$sc_box_spacing]
} 

#Create pdiffusioncontact area#
#Pdiffusioncontact starts here#
#Contacts for sorce and drain#
set sc_mvpdc_width 34
set sc_mvpdc_height 17
set sc_mos_terminals 2
set sc_terminals_spacing 6035
set sc_box_position_x [expr $x+258]
set sc_box_position_y [expr $y+1506]
for {set j 1} {$j <= $sc_mos_terminals} {incr j} {
	box position $sc_box_position_x $sc_box_position_y
	box size $sc_mvpdc_width $sc_mvpdc_height
	paint mvpdcontact
	set sc_box_position_y [expr $sc_box_position_y+$sc_terminals_spacing]
} 

#Create n-well area#
set sc_nw_width 150
set sc_nw_height 6136
box position [expr $x+200] [expr $y+1464]
box size $sc_nw_width $sc_nw_height
paint nwell

##Pmos layout ends here##

