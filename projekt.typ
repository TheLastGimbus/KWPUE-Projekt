#import "../wspomaganie.typ": *;
#import "../../matiii.typ": *;
#import "../../mathEngineer.typ": *;
#show: matiSettings

#let rys(path, label, width: 8cm) = figure(image(path, width: width), caption: label, supplement: "Rys")

Mateusz Soszyński, 282935\
Grupa 3 (czwartek 12:30 - 14:45)\
12.01.2026

#title[
  Komputerowe wspomaganie projektowania układów elektronicznych

  *Projekt własny - mrugające serce*
]

= Wstęp

Celem projektu jest stworzenie płytki w kształcie serca, które przy przytrzymaniu przycisku będzie mrugać naprzemiennie diodami LED. Jego funkcja jest czysto ozdobna, co czyni je świetnym pomysłem na prezent dla bliskiej osoby :)

Sercem układu będzie NE555, pracujące w trybie astabilnym - układ ten jest łatwo dostępny w zasobach każdego elektronika, dzięki czemu projekt będzie prosty w realizacji, oraz nie wymaga dodatkowych umiejętności jak np. programowanie mikroprocesorów.

Schemat układu, jego symulacje oraz płytkę PCB zaprojektowałem w całości w programie KiCad. Następnie, z pomocą Pana mgr Grzegorza Klubińskiego, z sukcesem wytrawiłem i obrobiłem płytkę PCB, na której następnie zamontowałem wszystkie elementy. Finalnie więc projekt zakończył się sukcesem, gotowym efektem w dłoni, i duża ilością satysfakcji.

= Schemat układu

#rys("schematic.svg", "Schemat układu w KiCad'zie", width: 16cm)

= Symulacja

#rys("sim.png", "Przebieg symulacji pracy układu w KiCad'zie", width: 10cm)

= Projekt płytki PCB

#rys("pcb-color.svg", "Układ ścieżek PCB w KiCad'zie")

= Wykonanie płytki

== Wytrawianie

#rys("pcb.svg", "Ścieżki płytki do wydrukowania na papierze termotransferowym", width: 6cm)
#rys("pcb-print.jpg", "Ścieżki płytki wydrukowane na papierze termotransferowym", width: 7cm)
#rys("pcb-before-etch.jpg", "Płytka PCB gotowa do zanurzenia w wytrawiaczu")

#rys("pcb-fail.jpg", "Pierwsza wersja płytki, zakończona niepowodzeniem", width: 9cm)

== Obróbka

#rys("drill.jpg", "Wiercenie otworów w płytce PCB")

#rys("drilled.jpg", "Płytka PCB po całej obróbce")

== Montaż

#rys("ready.jpg", "Złożony układ")

#bibliography("bib.yml", title: "Przypisy")
