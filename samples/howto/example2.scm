(use text.ncurses)

(define (main args)
  (initscr)
  (raw)
  (keypad stdscr #t)
  (noecho)

  (printw "Type any character to see it in bold\n")
  (let1 ch (getch)
    (cond [(eqv? ch (KEY-F 1))
           (printw "F1 Key pressed")]
          [else
           (printw "The pressed key is ")
           (attron A-BOLD)
           (printw "%c" ch)
           (attroff A-BOLD)]))
  (refresh)
  (getch)
  (endwin)
  0)
