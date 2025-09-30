> [!NOTE]
> All of my GitHub repositories have been **archived** and will be migrated to
> Codeberg as I next work on them. This repository either now lives, or will
> live, at:
>
> https://codeberg.org/pbrisbin/ghu
>
> If you need to report an Issue or raise a PR, and this migration hasn't
> happened yet, send an email to me@pbrisbin.com.

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
macro index,pager ,u "\
  <enter-command>set my_old_pipe_decode=\$pipe_decode nopipe_decode<enter>\
  <pipe_message>ghu<enter>\
  <enter-command>set pipe_decode=\$my_old_pipe_decode<enter>\
  " \
  "Unsubscribe from any email with a List-Unsubscribe header"
```
