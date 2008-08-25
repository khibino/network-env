##
## $Header$
## --  --

orig_debian_dir = orig-debian
deb_version = $(shell dpkg-parsechangelog -l$(orig_debian_dir)/changelog | grep '^Version: ' | sed 's/^Version: //')
version = $(shell echo $(deb_version) | sed 's/-.*$$//')
deb_srcpkg_name = $(shell grep '^Source: ' $(orig_debian_dir)/control | sed 's/^Source: //')
deb_arch = $(shell dpkg-architecture -qDEB_BUILD_ARCH)
deb_work = $(shell pwd)/deb-work
deb_src_top = $(deb_work)/$(deb_srcpkg_name)-$(version)
deb_src_files = \
	$(deb_work)/$(deb_srcpkg_name)_$(deb_version)_$(deb_arch).changes \
	$(deb_work)/$(deb_srcpkg_name)_$(deb_version).dsc \
	$(deb_work)/$(deb_srcpkg_name)_$(deb_version).diff.gz \
	$(deb_work)/$(deb_srcpkg_name)_$(version).orig.tar.gz

info:
	@echo "deb_version = $(deb_version)"
	@echo "deb_srcpkg_name = $(deb_srcpkg_name)"
	@echo "version = $(version)"
	@echo "deb_src_files = $(deb_src_files)"

clean:
	rm -fr $(deb_work)

test:

install: test
	mkdir -p $(pm_root_dir) $(libexecdir)
	rsync --exclude CVS/ --exclude '*~' -auvv src/perl/Asahi $(pm_root_dir)/.
	install -m 644 $(path_config_pm) $(pm_root_dir)/Asahi/Commons/PathConfig.pm
	install -m 755 libexec/do-atsonpost.sh $(libexecdir)

deb-tree: clean
	mkdir -p $(deb_src_top)
	rsync -auv Makefile.in orig-debian src configure* $(deb_src_top)/.
	mv $(deb_src_top)/orig-debian $(deb_src_top)/debian
	(cd $(deb_work); tar zcvf $(deb_srcpkg_name)_$(version).tar.gz $(deb_srcpkg_name)-$(version))

dpkg: deb-tree
	(cd $(deb_src_top); debuild -uc -us)

##
## end of $Source$
##
