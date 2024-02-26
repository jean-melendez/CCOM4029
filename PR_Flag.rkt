#lang racket

(require 2htdp/image)
;; Jean Melendez
;; bandera.rkt - hacer la bandera de Puerto Rico

;; Number -> Image
;; Devuelve la bandera de Puerto Rico de tamano n

;; header
; (define (pr-flag n)
;  (circle 10 "solid" "red"))

;; template
;;(define (pr-flag n)
  ;;(... n ...))

;; ejemplo
;; dado: 600
;; espero (algo como)
;; https://www.google.com/search?q=pr+flag&client=firefox-b-d&sxsrf=AJOqlzX7NC95sLwPuvj18nf7oZl6cS0vEw:1678288120201&tbm=isch&source=iu&ictx=1&vet=1&fir=VFhfUUU0YC8vEM%252CeCZDuPmiMvPxzM%252C%252Fm%252F0c032q%253BzkVUlGJ0Oh_DuM%252Cbk37hYEseatsTM%252C_%253BYK_HapyDw-P5pM%252C5Dfh7ZXXQGbRaM%252C_%253ByYs_hRs5mbR1gM%252C5FV1RcKJPJNuCM%252C_%253BYxdcLUUrukvBWM%252ClamIDouCrrE5lM%252C_&usg=AI4_-kTwyucMXkCQ2ucQM0Z3mUchYq6NkQ&sa=X&ved=2ahUKEwipyvC5zsz9AhVMRjABHQanCiMQ_B16BAhwEAE#imgrc=VFhfUUU0YC8vEM
;;.


(define (pr-flag width)
(overlay
           (overlay/align "left" "middle"
                          (star (/ width 8) "solid" "white")
                          (rectangle width (/ width 2) "outline" "black"))
           (overlay/align "left" "middle"
                          (rotate 30 (triangle (/ width 2) "solid" "blue"))
                          (rectangle width (/ width 2) "outline" "black"))
           (overlay/align "left" "top"
                 (above/align "left"
                              (rectangle width (/ width 10) "solid" "red")
                              (rectangle width (/ width 10) "solid" "white")
                              (rectangle width (/ width 10) "solid" "red")
                              (rectangle width (/ width 10) "solid" "white")
                              (rectangle width (/ width 10) "solid" "red"))
                 (rectangle width (/ width 2) "outline" "black"))))
