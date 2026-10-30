(define-library (srfi 282 parameter)
  (export parameter?)
  (import (scheme base))
  ;; Not present as a type on: Bigloo, Chicken, Loko
  ;; Bundled by default on: Kawa
  (cond-expand
    (stklos
     (import
       (only SCHEME parameter?)))
    (chibi
     (import
       (only (chibi ast) opcode? opcode-class))
     (begin
       (define (parameter? obj)
         (and (opcode? obj)
              (= (opcode-class current-output-port)
                 (opcode-class obj))))))
    (guile
     (import
       (only (guile) parameter?)))
    (gauche
     (import
       (only (gauche parameter) parameter?)))
    (gambit
     (begin
       (define parameter ##parameter?)))))
