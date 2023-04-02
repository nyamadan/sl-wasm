all: sl
sl: sl-5.02/sl.c sl-5.02/sl.h
	$(CC) -g0 -O2 -fPIC -Wall -o sl.js sl-5.02/sl.c -I./PDCurses-3.9 -L./ -lpdcurses \
	-sWASM \
	-sALLOW_MEMORY_GROWTH \
	-sMODULARIZE \
	-sEXPORT_ES6 \
	-sNO_EXIT_RUNTIME \
	-sINVOKE_RUN=0 \
	-sUSE_SDL=2 \
	-sEXPORTED_RUNTIME_METHODS=['callMain']
clean:
	rm -f sl
distclean: clean