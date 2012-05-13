#lang racket

(require web-server/http)
(require (planet dherman/json:4:0))

(define (response/json
         json
         #:code [code 200]
         #:message [message #"Okay"]
         #:seconds [seconds (current-seconds)]
         #:cookies [cooks empty]
         #:headers [hdrs empty]
         #:preamble [preamble #""])
  (response
   code message seconds #"application/json"
   (append hdrs (map cookie->header cooks))
   (λ (out)
     (write-bytes preamble out)
     (write-json json out))))

(provide response/json)
