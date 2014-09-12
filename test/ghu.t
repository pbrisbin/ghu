In the default case, it curls the URL and greps the Unsubscribed notice.

[Test needs networking]

  $ "$TESTDIR"/../bin/ghu < "$TESTDIR"/fixtures/example.mail
  You've been unsubscribed from the thread

If given -o or --open, it passes the URL to $BROWSER

  $ BROWSER='echo X' "$TESTDIR"/../bin/ghu -o < "$TESTDIR"/fixtures/example.mail
  X https://github.com/notifications/unsubscribe/50812__eyJzY29wZSI6Ik5ld3NpZXM6TXV0ZSIsImV4cGlyZXMiOjE3MjYwNjE5NDksImRhdGEiOnsiaWQiOjQyMTk5ODMyfX0=--73b54a36b04981938dc13727f1f87dbc58c880d5

  $ BROWSER='echo X' "$TESTDIR"/../bin/ghu --open < "$TESTDIR"/fixtures/example.mail
  X https://github.com/notifications/unsubscribe/50812__eyJzY29wZSI6Ik5ld3NpZXM6TXV0ZSIsImV4cGlyZXMiOjE3MjYwNjE5NDksImRhdGEiOnsiaWQiOjQyMTk5ODMyfX0=--73b54a36b04981938dc13727f1f87dbc58c880d5

If given -p or --print, it prints the URL only

  $ "$TESTDIR"/../bin/ghu -p < "$TESTDIR"/fixtures/example.mail
  https://github.com/notifications/unsubscribe/50812__eyJzY29wZSI6Ik5ld3NpZXM6TXV0ZSIsImV4cGlyZXMiOjE3MjYwNjE5NDksImRhdGEiOnsiaWQiOjQyMTk5ODMyfX0=--73b54a36b04981938dc13727f1f87dbc58c880d5

  $ "$TESTDIR"/../bin/ghu --print < "$TESTDIR"/fixtures/example.mail
  https://github.com/notifications/unsubscribe/50812__eyJzY29wZSI6Ik5ld3NpZXM6TXV0ZSIsImV4cGlyZXMiOjE3MjYwNjE5NDksImRhdGEiOnsiaWQiOjQyMTk5ODMyfX0=--73b54a36b04981938dc13727f1f87dbc58c880d5

If given an invalid argument, it prints usage and errors with BSD's ERR_USAGE

  $ "$TESTDIR"/../bin/ghu foo bar
  Usage: ghu [options] < file
  
  Parse stdin as an email for any List-Unsubscribe header containing a URL. Visit
  that URL using curl, thereby unsubscribing you from the thread.
  
  Options:
    -o, --open    Open the unsubscribe link with $BROWSER, not curl
    -p, --print   Print the unsubscribe link, do not visit it
  
  [64]
