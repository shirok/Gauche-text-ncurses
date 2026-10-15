;;;
;;; Test text.ncurses
;;;

(use gauche.test)

(test-start "text.ncurses")
(use text.ncurses)
(test-module 'text.ncurses)

;; If you don't want `gosh' to exit with nonzero status even if
;; the test fails, pass #f to :exit-on-failure.
(test-end :exit-on-failure #t)
