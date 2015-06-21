README
=======

### knit_book("dir")

will copy the directory at the same level with the name _temp_<dir>

edits all rmd files in YAML to have

```
output:
  md_document:
    variant: markdown_github
```

via `inject_yaml_md_output()`


then renders each to markdown.

After the markdown is rendered, the book is created in the _book directory


Note the requirement for the trailing backslash for the dir (for now)

```
dir <- "sample_proj/"
book_dir <- prepare_book_dir(dir)
render_rmds_to_md(book_dir)
```

Then in node in the created directory

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
