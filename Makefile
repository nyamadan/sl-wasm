all: sl type
sl: sl-5.02/sl.c sl-5.02/sl.h
	$(CC) -g0 -O2 -fPIC -Wall -o ./dist/sl.mjs sl-5.02/sl.c -I./PDCurses-3.9 -L./PDCurses-3.9/sdl2 -lpdcurses \
	-sWASM \
	-sALLOW_MEMORY_GROWTH \
	-sMODULARIZE \
	-sEXPORT_ES6 \
	-sNO_EXIT_RUNTIME \
	-sINVOKE_RUN=0 \
	-sUSE_SDL=2 \
	-sSINGLE_FILE \
	-sEXPORTED_RUNTIME_METHODS=['callMain','specialHTMLTargets']
type: sl.d.ts
	cp ./sl.d.ts ./dist/sl.d.ts
clean:
	rm -f sl
distclean: clean