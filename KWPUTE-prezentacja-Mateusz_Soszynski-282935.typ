#import "@preview/polylux:0.4.0": *
#import "../../matiii.typ": *
#show: matiSettings


#let rys(path, label, height: 80%) = figure(image(path, height: height), caption: label, supplement: "Rys")

// Make the paper dimensions fit for a presentation and the text larger
#set page(paper: "presentation-16-9", numbering: "1/1", number-align: right)
#set text(size: 25pt, font: "Lato")
#set image(height: 80%)


// Use #slide to create a slide and style it using your favourite Typst functions
#slide[
  #set align(horizon)
  Komputerowe wspomaganie projektowania układów elektronicznych

  #align(center, [*Projekt własny - mrugające serce*])

  \ \
  #set text(size: 0.7em)
  Mateusz Soszyński, 282935\
  Grupa 3 (czwartek 12:30 - 14:45)\
  15.01.2026
]

#slide[
  #outline()
]

#slide[
  = Cel projektu
  #align(center, grid(columns: 3, gutter: 1em, align: horizon, image("old.jpg"),  [$->$], image("final.jpg")))
]

#slide[
  = Zasada działania

  #image("sim.png")

  #image("schematic.svg")


#align(center, grid(
  columns: 2,
  gutter: 3em,
  rys("falstad-h.png", [Przepływ prądu przy $U_"OUT"=V_"CC"$]),
  rys("falstad-l.png", [Przepływ prądu przy $U_"OUT"="GND"$]),
))

]

#slide[
  = Projekt płytki PCB

  #image("pcb.svg")

  #image("pcb-color.svg")
]

#slide[
  = Wykonanie płytki PCB

  #grid(
    columns: 2,
    rys("pcb.svg", "Ścieżki płytki do wydrukowania na papierze termotransferowym"),
    rys("pcb-print.jpg", "Ścieżki płytki wydrukowane na papierze termotransferowym"),
  )
  #rys("pcb-before-etch.jpg", "Płytka PCB gotowa do zanurzenia w wytrawiaczu")


#align(center, grid(
  columns: 2,
  gutter: 2em,
  rys("drill.jpg", "Wiercenie otworów w płytce PCB"),
  rys("drilled.jpg", "Płytka PCB po całej obróbce"),
))


#rys("ready.jpg", "Złożony układ")
]
