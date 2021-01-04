#
# SPDX-License-Identifier: GPL-3.0-or-later

cmake_minimum_required(VERSION 3.5)
project(scnvim VERSION 0.1.0)

find_program(NVIM nvim)

if(NVIM)
  message("Installing neovim plugin (scnvim).")
  include(GNUInstallDirs)

  if(NOT SCNVIM_PACK_PREFIX)
    set(SCNVIM_PACK_PREFIX "dist")
    message("No SCNVIM_PACK_PREFIX set, using default: '${SCNVIM_PACK_PREFIX}'.")
  else()
    message("SCNVIM_PACK_PREFIX set to '${SCNVIM_PACK_PREFIX}'.")
  endif()

  if(NOT SCNVIM_PLUGIN_DIR)
    set(SCNVIM_PLUGIN_DIR "${CMAKE_INSTALL_DATADIR}/nvim/site/pack/${SCNVIM_PACK_PREFIX}/start/${PROJECT_NAME}/")
    message("No SCNVIM_PLUGIN_DIR set, using default: '${SCNVIM_PLUGIN_DIR}'.")
  else()
    message("SCNVIM_PLUGIN_DIR set to '${SCNVIM_PLUGIN_DIR}'.")
  endif()

  if(NOT SCNVIM_SC_EXTENSIONS_DIR)
    set(SCNVIM_SC_EXTENSIONS_DIR "${CMAKE_INSTALL_DATADIR}/SuperCollider/Extensions/")
    message("No SCNVIM_SC_EXTENSIONS_DIR set, using default: '${SCNVIM_SC_EXTENSIONS_DIR}'.")
  else()
    message("SCNVIM_SC_EXTENSIONS_DIR set to '${SCNVIM_SC_EXTENSIONS_DIR}'.")
  endif()

  if(CMAKE_SYSTEM_NAME MATCHES "Linux")
    install(
      DIRECTORY autoload doc ftdetect ftplugin indent lua plugin syntax
      DESTINATION "${CMAKE_INSTALL_PREFIX}/${SCNVIM_PLUGIN_DIR}"
      FILES_MATCHING PATTERN "*.lua" PATTERN "*.txt" PATTERN "*.vim"
    )
    install(
      DIRECTORY "scide_${PROJECT_NAME}"
      DESTINATION "${CMAKE_INSTALL_PREFIX}/${SCNVIM_SC_EXTENSIONS_DIR}"
      FILES_MATCHING PATTERN "*.sc" PATTERN "*.schelp"
    )
    install(
      FILES COPYING README.md
      DESTINATION "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DOCDIR}"
    )
  endif()
endif()
