#lang racket
(require
  json
  web-server/http)

(provide
 make-success-json-response
 post
 post-to-jsexpr
 posts)

(define (make-success-json-response jsexpr)
  (response/full 200
                 #"OK"
                 (current-seconds)
                 #"application/json"
                 empty
                 (list (jsexpr->bytes jsexpr))))

(struct post (id title author body))

(define (post-to-jsexpr post)
  (hash
   `post_id (post-id post)
   `title (post-title post)
   `album (post-author post)
   `body (post-body post)))

(define posts
  (list
   (post 1 "Writing Blog Posts in Racket" "Dean" "You write a blog post in racket by writing racket")))