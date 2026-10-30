(define-library (srfi 282 environment)
  (export environment?)
  (import (scheme base))
  ;; Not present as a type on: Bigloo, Loko?, Gambit?
  ;; Bundled by default on: Chez
  (cond-expand
    (stklos
     (import
       (only SCHEME environment?)))
    (chibi
     (import
       (only (chibi ast) environment?)))
    (guile
     (import
       (rename (guile)
               (module? environment?))))
    (chicken
     (define (environment? obj)
       (eq? 'environment (##sys#slot obj 1))))
    (gauche
     (import
       (rename (gauche base)
               (module? environment?))))
    (kawa
     (define (environment? obj)
       (instance? obj gnu.mapping.Environment)))
    (teenyscheme
     (import
       (only (init) environment?)))))
