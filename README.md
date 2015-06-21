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

After the markdown is rendered, the book is created, then moved back to the initial directory?

```
dir <- "sample_proj/"
book_dir <- prepare_book_dir(dir)
render_rmds_to_md(book_dir)
```
