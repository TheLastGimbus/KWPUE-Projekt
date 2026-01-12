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
\ \ \ \ \
#rys("final.jpg", "Finalny efekt", width: 9cm)

#pagebreak()

= Wstęp

Celem projektu jest stworzenie płytki w kształcie serca, które przy przytrzymaniu przycisku będzie mrugać naprzemiennie diodami LED. Jego funkcja jest czysto ozdobna, co czyni je świetnym pomysłem na prezent dla bliskiej osoby :)

Sercem układu będzie NE555 - układ ten jest łatwo dostępny w zasobach każdego elektronika, dzięki czemu projekt będzie prosty w realizacji, oraz nie wymaga dodatkowych umiejętności jak np. programowanie mikroprocesorów.

Schemat układu, jego symulacje oraz płytkę PCB zaprojektowałem w całości w programie KiCad. Następnie, z pomocą Pana mgr Grzegorza Klubińskiego, z sukcesem wytrawiłem i obrobiłem płytkę PCB, na której następnie zamontowałem wszystkie elementy. Finalnie więc projekt zakończył się sukcesem, gotowym efektem w dłoni, i duża ilością satysfakcji.

= Założenia projektowe

Płytka będzie zasilana jednorazową baterią CR2032, oraz będzie mieścić się w dłoni. Wykonana będzie jednorazowo, ręcznie, dlatego problemem nie jest niestandardowy kształt płytki, natomiast problemami mogą okazać się:
- marginesy i grubości ścieżek - oba te parametry ustaliłem na 0,8 mm, dla bezpieczeństwa
- grubość płytki - gotowe serce będzie samą płytką, bez żadnej obudowy - płytka nie może być zbyt cienka, żeby się nie połamać - wybrałem więc najgrubszą, jaka była dostępna w OpenLabie - 2 mm
- montaż - całość montażu chciałbym przeprowadzić samą lutownicą - musze więc dobierać odpowiednio duże footprinty elementów, żeby było to możliwie ułatwione
- złożoność ścieżek - ręczne wytrawianie płytek dwu-stronnych jest bardzo podatne na błędy, będe więc musiał utrzymać cały schemat na jednej stronie

Diody led poukładane będą wzdłuż krawędzi, a po naciśnięciu przycisku będą naprzemiennie mrugać - kolejno co sekunde będą zapalać się wszystkie parzyste, lub nieparzyste diody. Do takiego działania świetnie nada się konfiguracja astabilna NE555. Zdecydowałem się na częstotliwość 1Hz, i pożytkując się artykułem na Wikipedii@wiki-ne555 ustaliłem, że układ będzie tak pracował w konfiguracji: $R_1=8.2 kOhm R_2=68 kOhm C_1=10 uF$

#rys("555-astable.svg", [NE555 w trybie astabilnym, Wikipedia@wiki-ne555])

#pagebreak()

Zasada przełączania par łańcuchów LED jest następująca: diody są połączone szerogowo, od $V_"CC"$ do GND - tak pozostawione, świeciłyby wszystkie na raz, jednak pomiędzy nimi podłączone jest wyjście NE555 - gdy $U_"OUT"=V_"CC"$, jeden łańcuch świeci, a drugi ma zarówno na katodzie jak i anodzie $V_"CC"$ - prąd więc nie płynie. Analogicznie przy $U_"OUT" = "GND"$:

#align(center, grid(
  columns: 2,
  gutter: 3em,
  rys("falstad-h.png", [Przepływ prądu przy $U_"OUT"=V_"CC"$], width: 6cm),
  rys("falstad-l.png", [Przepływ prądu przy $U_"OUT"="GND"$], width: 6cm),
))

= Schemat układu

#rys("schematic.svg", "Schemat układu w KiCad'zie", width: 16cm)

= Symulacja

Wykonałem symulacje pracy układu przez pierwsze 4 sekundy - widać jak kondensator cyklicznie ładuje i rozładowuje się. Okres cyklu jest nieco inny niż idealna 1s, ale to akceptowalne. Jak widać układ pracuje w 6V, a nie 3 z pojedynczej baterii tak jak oryginalnie zakładałem (o czym poniżej w: @montaz).

KiCad nie posiadał wbudowanego modelu symulacji NE555, jednak znalazłem odpowiedni plik .lib w internecie@github-ne555.

#rys("sim.png", "Przebieg symulacji pracy układu w KiCad'zie", width: 10cm)

= Projekt płytki PCB

Posiadając gotowy schemat, ułożyłem komponenty na projekcie płytki PCB.

Z racji oryginalnego kształtu płytki i ozdobnego charakteru, ułożenie ścieżek w odpowiednim kształcie zajęło wyjątkowo dużo czasu. Nie udało mi się uniknąć czterech połączeń na drugiej warstwie, ale nie oznacza to że będe musiał użyć płytki dwuwarstwowej - ograniczyłem ich długość do minimum, i w tamtych miejscach po prostu przeciągnę kawałek srebrzanki po drugiej stronie.

Footprint koszyczka na baterie który posiadałem nie był wbudowany w biblioteke KiCada, ale znalazłem go w internecie@battery-footprint. Footprinty LEDów dobrałem natomiast możliwie jak największe. Po wszystkim na płytce zostało sporo miejsca, więc umieściłem tam ozdobne napisy.

#rys("pcb-color.svg", "Układ ścieżek PCB w KiCad'zie")

= Wykonanie płytki

Na całym etapie wykonania płytki w OpenLabie ogromną pomocą wykazał się Pan Grzegorz Klubiński, ale też koledzy z sąsiednich kierunków którzy mieli tam zajęcia.

== Wytrawianie

Do wytrawienia płytki musiałem wydrukować odbicie lustrzane samej przedniej warstwy na specjalnym papierze termotransferowym.

#grid(
  columns: 2,
  rys("pcb.svg", "Ścieżki płytki do wydrukowania na papierze termotransferowym", width: 6cm),
  rys("pcb-print.jpg", "Ścieżki płytki wydrukowane na papierze termotransferowym", width: 6.75cm),
)

Nastepnie, wydruk jest odbijany na płytce na płycie grzewczej - ten etap jest bardzo ważny, i wykonanie go niedokładnie może skutkować przerwami w ścieżkach.
#rys("pcb-before-etch.jpg", "Płytka PCB gotowa do zanurzenia w wytrawiaczu", width: 7cm)

#pagebreak()

== Obróbka

Po wytrawieniu płytki pozostało odwiercenie otworów na elementy przewlekane, oraz wycięcie kształtu płytki i oszlifowanie jej z ostrych krawędzi.

#align(center, grid(
  columns: 2,
  gutter: 2em,
  rys("drill.jpg", "Wiercenie otworów w płytce PCB", width: 6.1cm),
  rys("drilled.jpg", "Płytka PCB po całej obróbce", width: 7cm),
))

== Montaż<montaz>

Na koniec została chyba najprzyjemniejsza część - montaż elementów na płytce:

#rys("ready.jpg", "Złożony układ")

Niestety, po uruchomieniu okazało się, że układ nie daje sobie rady na samych 3V z pojedynczej CR2032 - diody nieparzyste ledwo zauważalnie się świeciły. Pan Grzegorz zasugerował sprytne rozwiązanie - zastąpienie baterii dwoma o połowe cieńszymi CR2016 - nie wymagało to żadnej modyfikacji płytki, a układ działa w ten sposób na 6 V bez zarzutów!


#pagebreak()

= Wnioski<wnioski>

Projektowanie ścieżek PCB, które samo w sobie jest sprawą nietrywialną staje się bardziej czasochłonne przy nietypowych kształtach płytki, aczkolwiek nietypowe kształty wynikają zazwyczaj z nietypowych zastosowań, nad którymi z pewnością ciekawiej się pracuje.

Własnoręczne wytrawianie płytek jest też bardzo uczącym, ale podatnym na błędy procesem - wszystkie dotychczasowe schematy i rysunki są tak naprawde drugą, poprawioną wersją płytki - pierwsza zakładała ściezki i przerwy między nimi o szerokości 0,4 mm - trawiła się 40 minut, i po tym czasie miała miejsca niedotrawione, jak i przerwane ścieżki. Mogło to być spowodowane kombinacją:
- starego, zużytego wytrawiacza
- niedokładnego oczyszczenia płytki przed termotransferem
- niedokładnego termotransferu

W drugiej próbie pogrubiłem więc ścieżki do wyżej ustalonych 0,8 mm, jednak okazało się to potencjalnie zbędne, ponieważ po wymianie wytrawiacza i pomocy opiekunów sali, druga płytka wytrawiła się w zasadzie idealnie!

#rys("pcb-fail.jpg", "Pierwsza wersja płytki, zakończona niepowodzeniem", width: 9cm)



#pagebreak()

#bibliography("bib.yml", title: "Przypisy")
