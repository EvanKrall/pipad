$fa=1;
$fs=0.4;

eps = 0.01;



module chamfer_edge(length, depth, chamfer_angle) {
    translate([0, 0, -eps])
    linear_extrude(length + 2 * eps)
    polygon([
        [-eps, -eps],
        [(depth + eps) / tan(chamfer_angle), -eps],
        [-eps, depth + eps * tan(chamfer_angle)],
    ]);
}


module card(
    width=22,
    length=30,
    thickness=0.8,
    chamfer_depth=0.2,
    chamfer_angle=20,
    plating=0.035,
//    keys="bm", // must be sorted
    keys="bm",
    component_height=1.35,
) {
    
        all_keys = "abcdefghjklm";
        key_offsets = [
            6.625,
            5.625,
            4.625,
            3.625,
            2.625,
            1.625,
            -1.125,
            -2.125,
            -3.125,
            -4.125,
            -5.125,
            -6.125,
        ];

        connector_width = 19.85;
        connector_center = width/2;
    
        module bottom_chamfer(width=width, color="beige") {
            difference() {
                children(0);
                color(color) rotate([-90,180,-90]) scale([1,1,1]) chamfer_edge(width, chamfer_depth, chamfer_angle);
            };
        }
        
        module top_chamfer(width=width, color="beige") {
            difference() {
                children(0);
                color(color) translate([0, 0, thickness]) rotate([-90,0,90]) scale([1,1,-1]) chamfer_edge(width, chamfer_depth, chamfer_angle);
            };
        }
    
        module connector_milling() {
            module connector_side_milling() {
                translate([0,0,-eps])
                linear_extrude(thickness + 2*eps)
                union() {
                    // left
                    polygon([
                        [-eps, -eps],
                        [connector_center - connector_width/2, -eps],
                        [connector_center - connector_width/2, 3.5],
                        [connector_center - connector_width/2 - 0.5, 4],
                        [-eps, 4],
                    ]);
                    translate([connector_center - connector_width/2 - 0.5, 3.5]) circle(r=0.5);
                    
                    // right
                    polygon([
                        [width+eps, -eps],
                        [connector_center + connector_width/2, -eps],
                        [connector_center + connector_width/2, 3.5],
                        [connector_center + connector_width/2 + 0.5, 4],
                        [width+eps, 4],
                    ]);
                    translate([connector_center + connector_width/2 + 0.5, 3.5]) circle(r=0.5);

                };
            }
            
            module mill_key(x) {
                translate([x, 2.3, -eps]) cylinder(r=0.6, h=thickness+2*eps);
                translate([x-0.6, -eps, -eps]) cube([1.2, 2.3+eps, thickness+2*eps]);
            }
            
            difference() {
                children();
                
                color("beige") {
                    connector_side_milling(); // left side
                                    
                    for(keynum = search(keys, all_keys)) {
                        mill_key(connector_center+key_offsets[keynum]);
                    }
                }
            };
        }


        // FR4        
        top_chamfer()
        bottom_chamfer()
        connector_milling() {
            // mounting hole

            difference() {
                union() {
                    color("beige") translate([0,0,plating]) cube([width, length, thickness - 2*plating]);
                    color("gold") translate([connector_center - 2.75, length - 2.75, thickness-plating]) cube([5.5, 2.75, plating - eps]);
                    color("gold") translate([connector_center - 3, length - 4, eps]) cube([6, 4, plating-eps]);
                };
                translate([connector_center, length, -eps]) cylinder(r=1.75, h=thickness+2*eps);
            };
            
            // solder mask top
            color("green")
            difference() {
                translate([0, 2.5, thickness - plating - eps]) cube([width - eps, length - 2.5 - eps, plating+eps]);
                
                translate([connector_center, length, thickness-plating- 2*eps]) cylinder(r=2.75, h=plating+4*eps);
            }
            
            // top components
            color("#444444")
            difference() {
                translate([0.1, 4.1, thickness-2*eps]) cube([width-0.2, length-4.2, component_height]);
                translate([connector_center, length, thickness-3*eps]) cylinder(r=2.75, h=component_height+6*eps);
            }
            
            
            // solder mask bottom
            color("green")
            difference() {
                translate([eps, 2.5, 0])
                cube([width - 2 * eps, length - 2.5 - eps, plating + eps]);
                    
                translate([connector_center - 3, length - 1, -eps])
                cube([6, 1, plating+4*eps]);
    
                translate([connector_center, length - 1, -eps])
                cylinder(r=3, h=plating+4*eps);
            };
        };
        
        
        module pin_bottom() {
            translate([-0.175,0,eps]) bottom_chamfer(0.35, color="gold") cube([0.35, 2.5, plating + eps]);
        }
        
        module pin_top() {
            translate([-0.175,0,-eps]) top_chamfer(0.35, color="gold") translate([0,0,thickness - plating]) cube([0.35, 2.5, plating]);
        }

        
        module pins(first_start, bdwys, final_end) {
            ends = [for (bdwy = bdwys) first_start - bdwy];
            starts = [for (end = ends) end - 2.5];

            keynums = search(keys, all_keys);
            first_end = (len(keynums) > 0) ? ends[keynums[0]] : final_end;
            
            color("gold") {
                for(dx = [first_start:-0.5:first_end]) translate([connector_center + dx, 0, 0]) children();
            }
            
            if (len(keys) > 0) {
                second_start = starts[keynums[0]];
                second_end = (len(keynums) > 1)? ends[keynums[1]] : final_end;
                
                color("gold") {
                    for(dx = [second_start:-0.5:second_end]) translate([connector_center + dx, 0, 0]) children();
                }
            }
            
            if (len(keys) > 1) {
                third_start = starts[keynums[1]];
                third_end = final_end;
                
                color("gold") {
                    for(dx = [third_start:-0.5:third_end]) translate([connector_center + dx, 0, 0]) children();
                };
            }
        }

        // bottom pins
        pins(
            9,
            concat([for (i = [1:1:6]) i], [for (i = [9:1:14]) i]),
            -9
        ) pin_bottom();
       
        // top pins
        pins(
            9.25,
            concat([for (i = [1.5:1:6.5]) i], [for (i = [9:1:14]) i]),
            -9.25 // one extra pin on top
        ) pin_top();

}

card();