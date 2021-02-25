# ipad_touchscreen_driver_gt9113

This is part of my larger [project to put a single-board computer inside the original iPad](https://hackaday.io/project/177256-put-a-modern-sbc-into-an-original-ipad).

This circuit uses the GT9113 touchscreen controller from Goodix, which seems to be the only capacitive touchscreen controller I can find that:
- is available in small quantities (via Chinese retailers like AliExpress)
- has enough TX and RX lines to drive the iPad's screen
- uses a footprint that isn't super-fine-pitch BGA, which would require a PCB manufacturer that can do 3/3 traces and 0.15mm drills.)

The last requirement rules out the chip I used in my [first attempt at this board](https://github.com/EvanKrall/ipad_touchscreen_driver).

See the rendered images and gerbers on the [releases page](https://github.com/EvanKrall/ipad_touchscreen_driver_gt9113/releases/latest/)
