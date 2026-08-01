VERSION_MAJOR := 1
VERSION_MINOR := 0
VERSION_MICRO := 4

all:
	mkdir -p plugin/build
	sed -e 's/VERSION_MAJOR/$(VERSION_MAJOR)/' -e 's/VERSION_MINOR/$(VERSION_MINOR)/' -e 's/VERSION_MICRO/$(VERSION_MICRO)/' plugin/AzaharArticSetup.plgInfo > plugin/build/AzaharArticSetup.plgInfo
	$(MAKE) -C plugin VERSION_MAJOR=$(VERSION_MAJOR) VERSION_MINOR=$(VERSION_MINOR) VERSION_MICRO=$(VERSION_MICRO)
	bin2c -d app/includes/plugin.h -o app/sources/plugin.c plugin/AzaharArticSetup.3gx
	$(MAKE) -C app VERSION_MAJOR=$(VERSION_MAJOR) VERSION_MINOR=$(VERSION_MINOR) VERSION_MICRO=$(VERSION_MICRO)

clean:
	$(MAKE) -C plugin clean
	rm -f app/sources/plugin.c
	rm -f app/includes/plugin.h
	$(MAKE) -C app clean

re: clean all