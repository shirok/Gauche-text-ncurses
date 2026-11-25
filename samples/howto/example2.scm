(use text.ncurses)

(define (main args)
  (initscr)
  (raw)
  (keypad stdscr #t)
  (noecho)

  (printw "Type any character to see it in bold\n")
  (let1 ch (getch)
    (cond [(eqv? ch (KEY_F 1))
           (printw "F1 Key pressed")]
          [else
           (printw "The pressed key is ")
           (attron A_BOLD)
           (printw "%c" ch)
           (attroff A_BOLD)]))
  (refresh)
  (getch)
  (endwin)
  0)
