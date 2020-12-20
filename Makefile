
data/pi.m2: src/lift_bivector.m2 
	cd src && M2 --script lift_bivector.m2 1,1,2

clean:
	rm -f data/*

all: data/pi.m2	
