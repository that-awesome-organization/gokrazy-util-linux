all: _gokrazy/extrafiles_arm64.tar _gokrazy/extrafiles_amd64.tar

_gokrazy/extrafiles_amd64.tar:
	cd docker && podman build -t util-linux:latest .
	mkdir -p _gokrazy/extrafiles_amd64/usr/local/bin
	podman run -v ${PWD}/_gokrazy/extrafiles_amd64/usr/local/bin:/shared util-linux:latest 2.38.1
	mv _gokrazy/extrafiles_amd64/usr/local/bin/blkid.static _gokrazy/extrafiles_amd64/usr/local/bin/blkid
	cd _gokrazy/extrafiles_amd64 && tar cf ../extrafiles_amd64.tar *
	rm -rf _gokrazy/extrafiles_amd64

_gokrazy/extrafiles_arm64.tar:
	cd docker && podman build -t util-linux:latest .
	mkdir -p _gokrazy/extrafiles_arm64/usr/local/bin
	podman run -v $PWD/_gokrazy/extrafiles_arm64/usr/local/bin:/shared util-linux:latest 2.38.1
	mv _gokrazy/extrafiles_arm64/usr/local/bin/blkid.static _gokrazy/extrafiles_arm64/usr/local/bin/blkid
	cd _gokrazy/extrafiles_arm64 && tar cf ../extrafiles_arm64.tar *
	rm -rf _gokrazy/extrafiles_arm64

clean:
	rm -f _gokrazy/extrafiles_*.tar
