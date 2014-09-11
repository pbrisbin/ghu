# GitHub Unsubscribe

Parses `stdin` as an email for a List-Unsubscribe header. Finds any URL present,
and `curl`s it.

*Note: recently hacked together, might not work, etc...*

## Installation

*TODO: AUR package*

## Usage

```
$ ghu < example.mail
```

## Usage with Mutt

```
# .muttrc
macro ,u <
 "<enter-command>set my_old_pipe_decode=\$pipe_decode nopipe_decode<enter>\
 "<enter-command>pipe_message ghu<enter>\
 "<enter-command>set pipe_decode=\$my_old_pipe_decode<enter>" \
 "Unsubscribe from any email with a List-Unsubscribe header"
```
