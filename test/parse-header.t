  $ run() { \
  >   "$TESTDIR"/../share/ghu/parse-header "$1" < \
  >     "$TESTDIR"/fixtures/example.mail; \
  > }

It parses arbitrary headers for command separated values

  $ run "List-Archive"
  https://github.com/thoughtbot/dotfiles

  $ run "List-Post"
  <mailto:reply+i-42522423-16da59d19f04d4424e6937ac2c382d086b09e643-50812@reply.github.com>

  $ run "List-Unsubscribe"
  <mailto:unsub+i-42522423-16da59d19f04d4424e6937ac2c382d086b09e643-50812@reply.github.com>, <https://github.com/notifications/unsubscribe/50812__eyJzY29wZSI6Ik5ld3NpZXM6TXV0ZSIsImV4cGlyZXMiOjE3MjYwNjE5NDksImRhdGEiOnsiaWQiOjQyMTk5ODMyfX0=--73b54a36b04981938dc13727f1f87dbc58c880d5>

  $ run "X-TUID"
  XO6VQGT/XJuZ
