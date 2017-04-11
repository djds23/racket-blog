#lang racket
(require
  "../lib/lib.rkt"
  web-server/servlet
  web-server/servlet-env)


(define (start req)
  (make-success-json-response (hash `posts (map post-to-jsexpr posts))))

(serve/servlet start
               #:servlet-regexp #rx"posts"
               #:command-line? #f)
