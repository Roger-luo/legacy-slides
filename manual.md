# Manual

This a manual for revealjs based slide

---

This repo is for Roger's slides. All the slides are based on revealjs and is converted by pandoc.
To use this repo, simply clone the repo to your local computer and type in the command line:

```shell
user@localhost:~{path-to-the-repo}/slides/ ./gen 
```

Then it will automatically generate slides from markdown files in _contents.


or you can use the [Julia](http://julialang.org) script to generate files:
```julia
user@localhost:~{path-to-the-repo}/slides/ julia gen.jl
```

## frame

each frame is marked by `#`:

```markdown
# (new frame title)

# another frame
## smaller title
```

## frame configuration

configuration should be included in `{}`

- **id** :: frame id begin with `#`,eg. `{#this-is-a-frame-id}`
- **background** :: `data-background`, eg.`{data-background="#DAA520"}`
- **background transition** :: `data-background-transition`,eg.`{data-background-transition="slide"}`
- **fragment** start with `> -`,eg.
```markdown
> - fragment 1
> - fragment 2
> - fragment 3
```
