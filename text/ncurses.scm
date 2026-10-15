;;;
;;; ncurses binding
;;;

(define-module text.ncurses
  (use gauche.native-type)
  (use gauche.ffi)
  (export-all)                          ;for now
  )
(select-module text.ncurses)

;; We treat these as pointer to an opaque object
(define-type <WINDOW*> (make-c-opaque-pointer-type 'WINDOW))
(define-type <SCREEN*> (make-c-opaque-pointer-type 'SCREEN))

(with-ffi (dlopen "libncurses" :versions '(6)) ()
  ;; curs_initscr (3x) - initialization & teardown
  (define-c-function initscr () <WINDOW*>)
  (define-c-function endwin () 'int)
  (define-c-function isendwin () 'bool)
  (define-c-function newterm `((const char*) ,<FILE*> ,<FILE*>) <SCREEN*>)
  (define-c-function set-term `(,<SCREEN*>) <SCREEN*>)
  (define-c-function delscreen `(,<SCREEN*>) 'void)

  ;; curs_kernel(3x) - Low-level curses routines
  (define-c-function def-prog-mode '() 'int)
  (define-c-function def-shell-mode '() 'int)
  (define-c-function reset-prog-mode '() 'int)
  (define-c-function reset-shell-mode '() 'int)
  (define-c-function resetty '() 'int)
  (define-c-function savetty '() 'int)
  ;; getsxy, setsxy - unsupported, as these are macros
  (define-c-function curs-set '(int) 'int)
  (define-c-function mvcur '(int int int int) 'int)
  (define-c-function napms '(int) 'int)
  ;; ripoffline - need callback

  ;; curs_window(3x) - Window manipulation
  (define-c-function newwin `(int int int int) <WINDOW*>)
  (define-c-function delwin `(,<WINDOW*>) 'int)
  (define-c-function mvwin `(,<WINDOW*> int int) 'int)
  (define-c-function subwin `(,<WINDOW*> int int int int) <WINDOW*>)
  (define-c-function derwin `(,<WINDOW*> int int int int) <WINDOW*>)
  (define-c-function mvderwin `(,<WINDOW*> int int) 'int)
  (define-c-function dupwin `(,<WINDOW*>) <WINDOW*>)
  (define-c-function wsyncup `(,<WINDOW*>) 'void)
  (define-c-function syncok `(,<WINDOW*> bool) 'int)
  (define-c-function wcursyncup `(,<WINDOW*>) 'void)
  (define-c-function wsyncdown `(,<WINDOW*>) 'void)

  ;; curs_refresh(3x) - Refresh windows or lines
  (define-c-function refresh '() 'int)
  (define-c-function wrefresh `(,<WINDOW*>) 'int)
  (define-c-function wnoutrefresh `(,<WINDOW*>) 'int)
  (define-c-function doupdate '() 'int)
  (define-c-function redrawwin `(,<WINDOW*>) 'int)
  (define-c-function wredrawln `(,<WINDOW*> int int) 'int)

  ;; getch(3)
  (define-c-function getch '() 'int)
  (define-c-function wgetch `(,<WINDOW*>) 'int)
  (define-c-function mvgetch '(int int) 'int)
  (define-c-function mvwgetch `(,<WINDOW*> int int) 'int)
  (define-c-function ungetch '(int) 'int)
  (define-c-function has-key '(int) <c-bool>)

  ;; printw(3)
  (define-c-function printw `(,<c-string> ...) 'int)
  (define-c-function wprintw `(,<WINDOW*> ,<c-string> ...) 'int)
  (define-c-function mvprintw `(int int ,<c-string> ...) 'int)
  (define-c-function mvwprintw `(int int ,<WINDOW*> ,<c-string> ...) 'int)
  ;; vwprintw, vw_printw - no va_list
  )
