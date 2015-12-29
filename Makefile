
data/pi.m2: res211.m2
	m2 --script res211.m2

clean:
	rm data/*

all: data/pi.m2	
