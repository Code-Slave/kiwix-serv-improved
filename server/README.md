kiwix-serve Docker image
========================

Usage summary
-------------

* `docker run [...] file1.zim [file2.zim] [file3.zim] [...]` - start server for the specified zim file(s) in data folder
* `docker run [...] generate-library` - generate a new or overwrite an existing `library.xml` file based on all ZIM files in data folder.
* `docker run [...] --library library.xml` - start server using a library file such as the one created by above `generate-library`

Listing each zim file
---------------------

* Download a ZIM file from <https://wiki.kiwix.org/wiki/Content>
* Given `wikipedia.zim` resides in `/tmp/zim/`, execute the following:

```
docker run --name kiwix-serve -v /tmp/zim:/data -p 8080:80 kiwix/kiwix-serve wikipedia.zim
```

Generate and use a library file
-------------------------------

* Download one or more ZIM file from <https://wiki.kiwix.org/wiki/Content>
* Given `*.zim` files reside in `/tmp/zim/`, execute the following:

```
docker run -v /tmp/zim:/data --rm -it kiwix/kiwix-serve generate-library
docker run --name kiwix-serve -v /tmp/zim:/data -p 8080:80 kiwix/kiwix-serve --library library.xml
```

* After adding or removing `*.zim` files run the same command.
* This will remove the old library and generate a new one with current list of ZIM files.

```
docker run -v /tmp/zim:/data --rm -it kiwix/kiwix-serve generate-library
docker restart kiwix-serve
```

Screenshots
-----------

![screenshot_1.png](https://github.com/kiwix/kiwix-tools/raw/master/docker/server/pictures/screenshot_1.png)
![screenshot_2.png](https://github.com/kiwix/kiwix-tools/raw/master/docker/server/pictures/screenshot_2.png)
