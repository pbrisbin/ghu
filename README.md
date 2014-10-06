# GitHub Unsubscribe

```
Usage: ghu [options] < file

Parse stdin as an email for any List-Unsubscribe header containing a URL. Visit
that URL using curl, thereby unsubscribing you from the thread.

Options:
  -o, --open    Open the unsubscribe link with $BROWSER, not curl
  -p, --print   Print the unsubscribe link, do not visit it

```

The only thing GitHub-specific is that after we `curl` the URL, we check the
HTML response for a bit of text to show that you have been unsubscribed. Beyond
that, this tool could be used on any email containing a List-Unsubscribe header
with a URL.

## Installation

ghu is available in the [AUR](https://aur.archlinux.org/packages/ghu).

Non-Arch users can clone the repo and either

- Always invoke `/full/path/to/bin/ghu`, or
- Use `make install`, the default prefix is `/usr/local`

## Usage with Mutt

```
# .muttrc
macro index,pager ,u \
 "<enter-command>set my_old_pipe_decode=\$pipe_decode nopipe_decode<enter>\
 | ghu<enter>\
 <enter-command>set pipe_decode=\$my_old_pipe_decode<enter>" \
 "Unsubscribe from any email with a List-Unsubscribe header"
```

## OSX Users

The `--open` option relies on the environment variable `$BROWSER`, which you
likely do not have set.

You could fix this by adding

```sh
export BROWSER='open'
```

To your shell initialization.

I will not be addressing these concerns myself, but welcome any PRs that do, so
long as the behavior on Linux is unchanged.
