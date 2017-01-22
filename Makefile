PROJ = project
EAGLE = /Applications/EAGLE-7.7.0/EAGLE.app/Contents/MacOS/EAGLE

all: gerbers

gerbers:
	$(EAGLE) -X -d EXCELLON -o $(PROJ).TXT $(PROJ).brd Drills Holes
	$(EAGLE) -X -d GERBER_RS274X -o $(PROJ).GML $(PROJ).brd Milling
	$(EAGLE) -X -d GERBER_RS274X -o $(PROJ).GTL $(PROJ).brd Top Pads Vias Dimension
	$(EAGLE) -X -d GERBER_RS274X -o $(PROJ).GBL $(PROJ).brd Bottom Pads Vias

clean:
	rm -f $(PROJ).GML
	rm -f $(PROJ).TXT
	rm -f $(PROJ).GTL
	rm -f $(PROJ).GBL
	rm -f $(PROJ).dri
	rm -f $(PROJ).gpi

veryclean: clean
	rm -f $(PROJ).b#[0-9]
	rm -f $(PROJ).s#[0-9]
