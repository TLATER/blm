bin_SCRIPTS = blm
CLEANFILES = $(bin_SCRIPTS)
EXTRA_DIST = $(srcdir)/init.sh.in $(srcdir)/dialog.sh.in $(srcdir)/select.sh.in $(srcdir)/main.sh.in

do_subst = sed -e 's,[@]datadir[@],$(datadir),g'

blm: $(EXTRA_DIST)
	$(do_subst) < /dev/null $^ > $@
	chmod +x blm
