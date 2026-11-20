VERSION_MAJOR := 1
VERSION_MINOR := 0
VERSION_MICRO := 4

all:
	mkdir -p plugin/build
	sed -e 's/VERSION_MAJOR/$(VERSION_MAJOR)/' -e 's/VERSION_MINOR/$(VERSION_MINOR)/' -e 's/VERSION_MICRO/$(VERSION_MICRO)/' plugin/AzaharArticSetup.plgInfo > plugin/build/AzaharArticSetup.plgInfo
	$(MAKE) -C plugin VERSION_MAJOR=$(VERSION_MAJOR) VERSION_MINOR=$(VERSION_MINOR) VERSION_MICRO=$(VERSION_MICRO)
	bin2s plugin/AzaharArticSetup.3gx -H app/includes/AzaharArticSetup_3gx.h > app/sources/AzaharArticSetup_3gx.s
	$(MAKE) -C app VERSION_MAJOR=$(VERSION_MAJOR) VERSION_MINOR=$(VERSION_MINOR) VERSION_MICRO=$(VERSION_MICRO)

clean:
	$(MAKE) -C plugin clean
	rm -f app/sources/AzaharArticSetup_3gx.s
	rm -f app/includes/AzaharArticSetup_3gx.h
	$(MAKE) -C app clean

re: clean all