#import "@preview/polylux:0.4.0": *
#import "../../matiii.typ": *
#show: matiSettings

#let rys(path, label, height: 80%) = figure(image(path, height: height), caption: label, supplement: none)

// Make the paper dimensions fit for a presentation and the text larger
#set page(paper: "presentation-16-9", numbering: "1/1", number-align: right)
#set text(size: 25pt, font: "Lato")
#set image(height: 80%, fit: "contain")

// Use #slide to create a slide and style it using your favourite Typst functions
#slide[
  #set align(horizon)
  #set align(top)
  Komputerowe wspomaganie projektowania układów elektronicznych

  #set align(horizon)
  #set text(size: 40pt)
  #set par(first-line-indent: 0pt)
  #align(center, [*Projekt własny - mrugające serce 🩵*])

  #set align(bottom)
  #set text(size: 20pt)
  Mateusz Soszyński, 282935\
  Grupa 3 (czwartek 12:30 - 14:45)\
  15.01.2026
]

#slide[
  #outline()
]

#slide[
  = Cel projektu
  #align(center, grid(
    columns: 3,
    gutter: 1em,
    align: horizon,
    rys("old.jpg", "Oryginalny układ z gimnazjum"),
    [$->$],
    rys("final.jpg", "Nowa jakość na studiach"),
  ))
]

#slide[
  = Zasada działania

  NE555 w trybie astabilnym:

  #align(center, image("555-astable.svg", height: 75%))
]

#slide[

  Zasadza przełączania ledów parzystych i nieparzystych:

  #align(center, box(height: 68%, grid(
    columns: 2,
    gutter: 3em,
    rys("falstad-h.png", [$U_"OUT" = V_"CC" => $ Ledy parzyste], height: 100%),
    rys("falstad-l.png", [$U_"OUT" = "GND" => $ Ledy nieparzyste], height: 100%),
  )))
]

#slide[
  Symulacja układu:

  #box(height: 80%, grid(
    columns: (53%, auto),
    gutter: 1em,
    rys("sim.png", [Przebieg $U_"OUT"$ i naładowania kondensatora]),
    rys("sim-d.png", "... oraz prądu na diodach parzystych i nieparzystych"),
  ))

]
#slide[
  Schemat układu:
  #align(center, image("schematic.svg", height: 87%))
]

#slide[
  = Projekt płytki PCB

  #align(center, grid(columns: 2, gutter: 2em, image("pcb-color.svg", height: 85%), [
    #set align(left)
    Specyfikacja wykonania - pod ręczne wytrawianie i montaż lutownicą:
    - płytka jednostronna
    - bez solder maski
    - grubość - 2mm
    - ścieżki i odstępy między nimi - 0,8mm
    - footprinty elementów - możliwie duże
    - układ ścieżek - możliwie ładny ✨
  ]))
]

#slide[
  = Wykonanie płytki PCB

  #box(height: 89%, grid(
    columns: 3,
    rys("pcb.svg", "Ścieżki płytki do wydrukowania"),
    rys("pcb-print.jpg", "Wydruk na papierze termotransferowym"),
    rys("pcb-before-etch.jpg", "Płytka PCB gotowa do wytrawiania"),
  ))
]
#slide[

  #align(center, grid(
    columns: 2,
    gutter: 2em,
    rys("drill.jpg", "Wiercenie otworów w płytce PCB"),
    rys("drilled.jpg", "Płytka PCB po całej obróbce"),
  ))
]
#slide[
  #rys("ready.jpg", "Złożony układ", height: 100%)
]

#slide[

  #align(center, text(size: 3em)[
    \
    Dziękuje za uwage 🩵
  ])
]