(use text.ncurses)

(define (main args)
  (initscr)
  (printw "Hello World!!!")
  (refresh)
  (getch)
  (endwin)
  0)
