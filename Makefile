
data/pi.m2: src/lift_bivector.m2
	cd src && m2 --script lift_bivector.m2

clean:
	rm -f data/*

all: data/pi.m2	
