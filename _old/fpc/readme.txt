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

