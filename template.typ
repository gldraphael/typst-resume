#import "style.typ": *

#let resume(
        full-name: "", 
        email: "", 
        place: "", 
        links: (), 
        body
      ) = {

  // Set the document's basic properties.
  set document(author: full-name, title: full-name)
  set page(paper: "us-letter")

  // Set body font family.
  set text(font: body-font, lang: "en")
  show math.equation: set text(weight: 400)
  show heading: set text(font: heading-font)
  
  grid(
    columns: (1fr, 1fr, 1fr),
    align(left)[
      #text(place, font: heading-font)\
      #text(email, font: heading-font)
    ],
    align(center)[
      #block(text(font: heading-font, weight: 700, 1.75em, full-name))
    ],
    align(right)[
      #for l in links { [#text(link(l.link, l.name), font: heading-font) \ ] }
    ]
  )
  
  body
}

#let section(title: "") = {
  [
    = #text(title, fill: theme-color)
  ]
}

#let position(
  title: "",
  company: "",
  location: "",
  dates: ""
) = {
  [
    #grid(
      columns: (1fr, 1fr, 1fr),
      align(left)[
        #text(title, font: heading-font, weight: 700)
      ],
      align(center)[
        #text(company, font: heading-font, weight: 700) \ 
        #text(location, font: heading-font, size: 0.9em)
      ],
      align(right)[
        #text(dates, font: heading-font, weight: 700)
      ]
    )
  ]
}
