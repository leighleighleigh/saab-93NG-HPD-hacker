Thanks to users **ruthenianboy** and **bojer** of trionictuning.com for their work in reverse-engineering the protocol of the SID.

Interface
- **115200baud** UART over CAN physical layer.

Command frame format
- DLC[1] + CONTENT[x] + CHECKSUM[1], CHECKSUM being the MSB of the sum of all previous bytes.
- About 12 commands have been sniffed while used in stock operation, however 32 returned response codes. 
- This might indicate extra features!

Response frame types, from SID back to ICM.
- ACK, NACK, ERROR, VALUE ...

MISC:
- Panel resolution (green) is 384x64 px
- Icon resolution (orange) is 64x64 px
- Temp and light sensors
- 4 font sizes, underscore, solid background, flashing, and align right styles.

ICON DATA CODES:
- dec	desc		
- 65	!		
- 66	washer 	?	
- 67	wipers !		
- 68	CRUISE		
- 69	BREAK Park		
- 70	BREAK !		
- 71	BREAK ABS		
- 72	BATTERY		
- 73	COOLANT		
- 74	OIL temp		
- 75	OIL		
- 76	OIL level		
- 77	ENGINE		
- 78	CAR		
- 79	DOOR FL		
- 80	DOOR RL		
- 81	DOOR FR		
- 82	DOOR RR		
- 83	BOOT		
- 84	LIGHT		
- 85	AHL !		
- 86	GEARBOX !		
- 87	GEARBOX temp		
- 88	TURTLE	???	
- 89	SERVICE		
- 90	PASS		
- 91	SRS		
- 92	KEY		
- 93	KEY battery		
- 94	LOCK !		
- 95	CAR LOCK !		
- 96	SEATS rear		
- 97	"P"		
- 98	SPA on	???	
- 99	SPA off	???	
- 100	SPA !		
- 101	Tire !		
- 102	Tire dot		
- 103	STP		
- 104	SEATS front		
- 105	SCL lock		
- 106	SCL !		
- 107	ESP on		
- 108	ESP off		
- 109	STP closed	???	
- 110	STP !		
- 111	STP down	???	
- 112	SNOW/ACC off	???	
- 113	Fuel lid open	???	
- 114	NAV up		arrow
- 115	NAV up right		
- 116	NAV up left		
- 117	NAV UP		filled
- 118	NAV UP RIGHT		filled
- 119	NAV UP LEFT		filled
- 120	NAV HALF SKEW RIGHT		filled
- 121	NAV HALF SKEW LEFT		filled
- 122	NAV RIGHT		filled
- 123	NAV LEFT		filled
- 124	NAV RIGHT DOWN		filled
- 125	NAV LEFT DOWN		filled
- 126	NAV RETURN right		filled
- 127	NAV RETURN left		filled
- 128	NAV DOT		
- 129-135	NAV G right		arrow filled
- 136-142	NAV G left		arrow filled
- 143-156	NAV G background		
- 157	NAV TRIANGLE UP		filled
- 158	NAV UP target		filled
- 159	NAV WAYPOINT		filled
- 160	NAV up long		
- 161	NAV skew up right		
- 162	NAV right		
- 163	NAV skew down right		
- 164	NAV down		
- 165	NAV skew down left		
- 166	NAV left		
- 167	NAV skew up left		
- 168	NAV ROTATE LEFT		filled
- 169	NAV ROTATE RIGHT		filled


Discovered commands (data portion only):
- 0x80,0x80 clear screen / screen off
- 0x80,0x00,0xCE,0x00 (sets backlight for orange portion, last value is brightness)
            0xC, shows only the orange portion.

- 0x80,0x00-x79 screen on, brightess command?
- 0x83,0x00 (gets some kind of info from SID, status query?)
- 0x81,0x00 (gets info from SID, status query?)
- 0x11 < draw data to screen

Return values
- 0xff,0x00 (success)
- 0xfe (failure?)


