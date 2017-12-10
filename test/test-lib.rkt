#lang racket
(require
  "../lib/lib.rkt"
  web-server/http
  json
  rackunit)

(test-case
 "creates an OK(200) response"
 (define response (make-success-json-response (hash `success #t)))
 (check-eq? (response-code response) 200))

(test-case
 "post-to-jsexpr creates valid json from song"
 (define first-post (post 1 "Writing Blog Posts in Racket" "Dean" "You write a blog post in racket by writing racket"))
 (define blob (post-to-jsexpr first-post))
 (check-true (jsexpr? blob)))
