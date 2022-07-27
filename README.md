
# Deprecated - instead use https://bookdown.org/yihui/bookdown/ which is what this repo does, but way better


README
=======

The two commands (currently) to knit the book are

```
prepare_book_dir()
```

which will copy the directory at the same level with the name `_temp_<dir>`

and then edits all rmd files in YAML to have:

```
output:
  md_document:
    variant: markdown_github
```

Then 

```
render_rmds_to_md()
```

renders each to markdown. After the markdown is rendered, the book is created in the _book directory in the newly created directory.

For example, a project with a folder `sample_proj` containing the Rmd files would be rendered as such:

**Note** the requirement for the trailing backslash for the dir (for now)

```
dir <- "sample_proj/"
book_dir <- prepare_book_dir(dir)
render_rmds_to_md(book_dir)
```

Then in the created directory from the command line (with gitbook installed in your path via node)

```
gitbook install
gitbook build
```

Will eventually move these to system calls but R isn't playing nice with my node path
on windows for now.

### under consideration

* how to move/cache a book so it doesn't get re-rendered completely every time, but also
doesn't pollute with a _temp file

* diplaying code output - either show/hide in css or remove via echo = F in knitr directly

* programmatically creating/assisting with table of contents for all rmd files

### untested

* creating pdf/.epub/etc, only html has been checked
* only basic injection/directory tests, so still a little bit of wild west for more complex folder structures
* 

## node requirement

node/iojs are required to use gitbook, and can be installed globally from npm with:

```
npm install -g gitbook
```

