#import "@preview/fletcher:0.5.4" as fletcher: diagram, node, edge
#import fletcher.shapes: house, hexagon, pill, parallelogram, diamond, hexagon, ellipse
#import calc

#set page("a4", flipped:true, margin: 5mm, fill: white)
#set text(font: "New Computer Modern")


== La figure originale

#align(center+horizon)[
#figure(
  image("fig/original_fig.png", width: 20cm),
  caption: [Figure originale.],
) <original_fig>
]

== La figure modifiée

#v(1cm)

#let fatgraynode(radius, angle, enclose) = node(
  (radius * calc.cos(angle), radius * calc.sin(angle)),
  shape: ellipse,
  width: 65mm,
  height: 25mm,
  fill: black.lighten(60%),
  enclose: enclose
)

#let bluenode(radius, angle, label, name) = node(
  (radius * calc.cos(angle), radius * calc.sin(angle)),
  align(center, label),
  shape: ellipse,
  width: 45mm,
  height: 25mm,
  fill: teal.lighten(60%),
  stroke: teal,
  name: name
)

#let blacknode(radius, angle, label, name) = node(
  (radius * calc.cos(angle), radius * calc.sin(angle)),
  align(center, label),
  width: 40mm,
  height: 10mm,
  fill: black.lighten(60%),
  stroke: black,
  corner-radius: 5pt,
  name: name
)

#let rednode(radius, angle, label, name) = node(
  (radius * calc.cos(angle), radius * calc.sin(angle)),
  align(center, label),
  width: 40mm,
  height: 15mm,
  fill: red.lighten(60%),
  stroke: red,
  corner-radius: 0pt,
  name: name
)

#let edgenode(radius, angle, label, name) = node(
  (radius * calc.cos(angle), radius * calc.sin(angle)),
  align(center, label),
  fill: white,
  name: name
)

#let R = 2.2
#align(center+horizon)[
#diagram(
  spacing: 10pt,
  
  cell-size: (8mm, 10mm),
  edge-stroke: 1pt,
  edge-corner-radius: 5pt,
  mark-scale: 70%,
  (
    
    
    blacknode(R, -150deg, [A. MODELE INFORMATIQUE], <a>),
    blacknode(R, -30deg, [B. SYSTEME REEL], <b>),
    blacknode(R+.9, 90deg, [C. MODELE \  CONCEPTUEL], <c>),
    rednode(R+.5, -90deg, [D. VALIDATION OPERATIONNELLE], <d>),
    rednode(R, 150deg, [E. VERIFICATION \ DU MODELE \ INFORMATISE], <e>),
    rednode(R, 30deg, [F. VALIDATION \ DU MODELE \ CONCEPTUEL], <f>),
    bluenode(0, 0, [O. VALIDITE \ DES DONNEES \ D'ENTREE], <O>),

    // fatgraynode(0, 0, (<O>, <a>, <b>, <c>, <d>, <e>, <f>)),
    edge(<a.north>, <d.west>, bend: 15deg, "solid-", stroke:red+1.5pt, "wave"),
    edge(<b.north>, <d.east>, bend: -15deg, "solid-", stroke:red+1.5pt,  "wave"),
    edge(<b.south>, <f.north>, bend: 0deg, "solid-", stroke:red+1.5pt,  "wave"),
    edge(<a.south>, <e.north>, bend: 0deg, "solid-", stroke:red+1.5pt, "wave"),
    edge(<e.south>, <c.west>, bend: -25deg, "-solid", stroke:red+1.5pt,  "wave"),
    edge(<f.south>, <c.east>, bend: 25deg, "-solid", stroke:red+1.5pt,  "wave"),
    edge(<O>, <a.south-east>, "-solid", stroke:teal+2pt),
    edge(<O>, <b.south-west>, "-solid", stroke:teal+2pt),
    edge(<O>, <c.north>, "-solid", stroke:teal+2pt),
    edge(<c>, <b>, "solid-solid", stroke:black+2pt),
    edge(<c>, <a>, "solid-solid", stroke:black+2pt),
    edge(<a>, <b>, "solid-solid", stroke:black+2pt),
    edgenode(1.05, 30deg, text(9pt)[ANALYSE & \ MODELISATION], <g>),
    edgenode(1.05, 150deg, text(9pt)[IMPLEMENTATION], <g>),
    edgenode(1.15, -90deg, text(9pt)[EXPERIMENTATIONS], <g>),
  ),
)
]
