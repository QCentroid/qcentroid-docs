# Instructions

Make sure your "Path" environmental variable includes the path to the python install. 
If using the windows installer, tick this box during the install process. 
If you have had previous versions of python or mkdocs installed you may run into issues. If in doubt - and if possible, try uninstalling python completely and removing any python paths from your "Path" environmental variable. Then reinstalling python and mkdocs afresh.

## Run

```shell
docker build -t imidocs .
docker run --rm -p9000:80 imidocs -d
```
```shell
nerdctl build -t imidocs .
nerdctl run --rm -p9000:80 imidocs -d
```
open `http://127.0.0.1:9000` in your browser


## Advanced compilation (native)

### Mkdocs and theme setup (installs markdown and mkdocs)

Required software: 

* python 3 (recomended 3.9.2)


```shell
pip install mkdocs-material
pip install markdown-include
```

### Running Mkdocs

in a console, navigate to the docs root directory:

```shell
mkdocs serve
```
open `http://127.0.0.1:8000` in your browser

to compile to an html execute the following command:
```shell
mkdocs build
```
The output folder with the rendered html site is in `docs/site`.

## Docker run without build


in a console, navigate to the docs root directory:

```shell
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material
docker run --rm -it -p 8000:8000 -v "%cd%":/docs squidfunk/mkdocs-material

```
```
nerdctl run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

```
open `http://127.0.0.1:8000` in your browser

