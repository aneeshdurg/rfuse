all: NullFS

NullFS:
	gcc -Wall -Werror NullFS.c `pkg-config rfuse3 --cflags --libs` -o NullFS

clean:
	rm -rf NullFS
