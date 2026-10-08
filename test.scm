;;;
;;; Test text.ncurses
;;;

(use gauche.test)

(test-start "text.ncurses")
(use text.ncurses)
(test-module 'text.ncurses)

;; The following is a dummy test code.
;; Replace it for your tests.
(test* "test-gauche_text_ncurses" "gauche_text_ncurses is working"
       (test-gauche_text_ncurses))

;; If you don't want `gosh' to exit with nonzero status even if
;; the test fails, pass #f to :exit-on-failure.
(test-end :exit-on-failure #t)
