How to use:

docker run --rm --name fpccompiler fpc <parametrs for fpc> -iW

f.e.:
docker run --rm --name fpccompiler fpc -iW

docker run -v /mnt/datashareone/sources:/sources --rm --name fpccompiler fpc:latest -iW

docker run -v /mnt/datashareone/sources:/sources --rm --name fpccompiler fpc:latest /sources/helloworld.pas
Free Pascal Compiler version 3.3.1 [2019/10/08] for x86_64
Copyright (c) 1993-2019 by Florian Klaempfl and others
Fatal: Can't find unit system used by helloworld
Fatal: Compilation aborted
Error: /opt/bin/fpc/bin/ppcx64 returned an error exitcode



kompilace lazarus
/usr/bin/ld: cannot find -lgdk-x11-2.0
/usr/bin/ld: cannot find -lX11
/usr/bin/ld: cannot find -lgdk_pixbuf-2.0
/usr/bin/ld: cannot find -lgtk-x11-2.0
/usr/bin/ld: cannot find -lgobject-2.0
/usr/bin/ld: cannot find -lglib-2.0
/usr/bin/ld: cannot find -lgthread-2.0
/usr/bin/ld: cannot find -lgmodule-2.0
/usr/bin/ld: cannot find -lpango-1.0
/usr/bin/ld: cannot find -lcairo
/usr/bin/ld: cannot find -latk-1.0
/usr/bin/ld: cannot find -lpangocairo-1.0


running:
Lin64RunConfiguration
======================================================================
/opt/scripts/install_lazarus.sh: line 15: pushd: /opt/bin/lazarus/runlazarus/linux: No such file or directory
/opt/scripts/install_lazarus.sh: line 30: popd: directory stack empty
/opt/scripts/install_lazarus.sh: line 33: pushd: /opt/bin/lazarus/runlazarus: No such file or directory
/opt/scripts/install_lazarus.sh: line 37: popd: directory stack empty
======================================================================
error get status 1 when run Lin64RunConfiguration
======================================================================
The command '/bin/sh -c $ScriptsDir/install_lazarus.sh Lin64' returned a non-zero code: 1



how to run x program ... josh blog
/lib/systemd/systemd-udevd --debug &
udevadm trigger

jiny blog - xinit run program in case no wm manager is present
xinit /opt/bin/lazarus/bin/startlazarus $* -- :0 vt$XDG_VTNR

it is working quit well, but laz window is small and is not possible to resize it
but when I run program from lazarus, cannot switch windows etc, looks like some
light wm will be necessary

a taky potrebuju nainstalovat debuger  ... gdb nebo pascalovsky, mozna oba


/lib/systemd/systemd-udevd &
udevadm trigger






#!/bin/bash

# based on josh blog, otherwise mouse and keyboard are not detected automaticly
# (if neccessary, instead of it create X conf. file manually)

#/lib/systemd/systemd-udevd --debug &
#udevadm trigger

/lib/systemd/systemd-udevd &
udevadm trigger

# based on other blog start lazarus
# jiny blog - xinit run program in case no wm manager is present
# xinit /opt/bin/lazarus/bin/startlazarus $* -- :0 vt$XDG_VTNR

#it is working quit well, but laz window is small and is not possible to resize it

/opt/bin/lazarus/bin/startlazarus











fpcmkcfg tool
root@71338b522cb8:/# /opt/bin/fpc/bin/fpcmkcfg --help
Error: Unknown option.--help
Usage: fpcmkcfg [options]
Where options is one or more of
  -t filename   Template file name. Default is built-in
  -o filename   Set output file. Default is standard output.
  -d name=value define name=value pair.
  -h            show this help and exit.
  -u name       remove name from list of name/value pairs.
  -m            show builtin macros and exit.
  -b            show builtin template and exit.
  -s            skip the creation of a backup-file.
  -p            force directory creation.
  -v            be verbose.
  -V            show version.
  -0            use built in fpc.cfg template (default)
  -1            use built in fp.cfg template
  -2            use built in fp.ini template
  -3            use built in fppkg.cfg template
  -4            use built in fppkg default compiler template


/opt/bin/fpc/bin/fpcmkcfg -3 -o file

potrebuji zkopirovat sablonu do /etc, mozna do default ... ale tam zatim neni potreba

a pri spusteni lazara ji zkopirovat do dom. adresare.  ~/.config/fppkg.cfg






