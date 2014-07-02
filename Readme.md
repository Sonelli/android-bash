Android Bash
=========

A docker image that builds bash binaries for Android.

For each supported Android CPU architecture (x86/ARM/MIPS) it will build both PIE ([position independant executable](http://en.wikipedia.org/wiki/Position-independent_code#Position-independent_executables)) and a non-PIE binary.

PIE binaries are supported on Android 4.1+ and mandatory on Android L and above.

Automated Build
----

```
$ docker run -v $(pwd):/target sonelli/android-bash
$ file bash-*
bash-x86-pie
bash-x86-nopie
bash-arm-pie
bash-arm-nopie
bash-mips-pie
bash-mips-nopie
```

Manual Build
----
```
$ docker run -i -t -v $(pwd):/target sonelli/android-bash /home/admin/shell
$ vi ~/build (tweak away)
$ ~/build
$ exit
$ ls bash-*
bash-x86-pie
bash-x86-nopie
bash-arm-pie
bash-arm-nopie
bash-mips-pie
bash-mips-nopie
```

Credits
----
This is made possible thanks to Dan Drown's Android build environment docker image:
http://blog.dan.drown.org/android-cross-compile-environment/
