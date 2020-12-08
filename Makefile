#
# SPDX-License-Identifier: GPL-3.0-or-later

PLUGIN_NAME=scnvim
PACK_PREFIX=dist
PREFIX:=/usr/local
PLUGIN_DIR:=$(PREFIX)/share/nvim/site/pack/$(PACK_PREFIX)/start/$(PLUGIN_NAME)/
SC_EXTENSIONS_DIR:=$(PREFIX)/share/SuperCollider/Extensions/$(PLUGIN_NAME)/

install: install_plugin_sources install_sc_sources

install_plugin_sources:
	install -vDm 644 autoload/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/autoload/
	install -vDm 644 autoload/health/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/autoload/health/
	install -vDm 644 autoload/$(PLUGIN_NAME)/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/autoload/$(PLUGIN_NAME)/
	install -vDm 644 doc/SCNvim.txt $(DESTDIR)/$(PLUGIN_DIR)/doc/supercollider.txt
	install -vDm 644 ftdetect/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/ftdetect/
	install -vDm 644 ftplugin/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/ftplugin/
	install -vDm 644 ftplugin/supercollider/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/ftplugin/supercollider/
	install -vDm 644 indent/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/indent/
	install -vDm 644 lua/*.lua -t $(DESTDIR)/$(PLUGIN_DIR)/lua/
	install -vDm 644 lua/$(PLUGIN_NAME)/*.lua -t $(DESTDIR)/$(PLUGIN_DIR)/lua/$(PLUGIN_NAME)/
	install -vDm 644 plugin/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/plugin/
	install -vDm 644 syntax/*.vim -t $(DESTDIR)/$(PLUGIN_DIR)/syntax/

install_sc_sources:
	install -vDm 644 scide_$(PLUGIN_NAME)/HelpSource/Classes/*.schelp -t $(DESTDIR)/$(SC_EXTENSIONS_DIR)/HelpSource/Classes/
	install -vDm 644 scide_$(PLUGIN_NAME)/Classes/*.sc -t $(DESTDIR)/$(SC_EXTENSIONS_DIR)/Classes/
	install -vDm 644 scide_$(PLUGIN_NAME)/Classes/SCNvimDoc/*.sc -t $(DESTDIR)/$(SC_EXTENSIONS_DIR)/Classes/SCNvimDoc/

.PHONY: install install_sc_sources install_plugin_sources
