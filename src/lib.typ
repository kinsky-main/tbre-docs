// Export your helper functions
#let hl = highlight
#let abbrev(abbreviation, full, inline: true) = {
  [
    #metadata((abbrev: abbreviation, full: full)) <acronym>
    #if { inline } { [#abbreviation (#full)] }
  ]
}

// The main template function
#let template(changelog: none, body) = [
  // ==========================================
  // MARK: PREAMBLE
  // ==========================================
  #set page(margin: (top: 2.8cm, rest: 2.5cm))
  #set text(font: "Roboto", size: 11pt)
  #show figure.where(kind: table): set figure.caption(position: top)
  #set page(numbering: "i")
  #show table: set par(justify: false)

  #set figure(
    numbering: (..nums) => {
      let section = counter(heading).get().first()
      let fig = nums.pos()
      ((section,) + fig).map(str).join(".")
    },
  )

  #show heading: it => {
    if it.level == 1 {
      counter(figure.where(kind: table)).update(0)
      counter(figure.where(kind: image)).update(0)
    }
    it
  }

  // Title page IMECHE header and footer
  #set page(
    header: place(top + left, dx: -2.5cm, dy: 0.5cm)[#block(width: 21cm)[#image(
      "/template/images/tbre_page_header.svg",
    )]],
    footer: place(top + left, dx: -2.5cm, dy: -0.5cm)[#block(width: 21cm)[#image(
      "/template/images/tbre_page_footer.svg",
    )]],
  )

  #set par(justify: true)
  #counter(heading).update(0)
  #set heading(numbering: "I")

  // Title page table
  #align(center)[
    #text(size: 28pt, fill: rgb("#005dab"), weight: "bold")[Document Title]
    #table(
      align: left,
      columns: (auto, 2fr),
      [*Document*], [Template],
      [*Author*],
      [#link("mailto:wfk20@bath.ac.uk")[Wenzel Kinsky (wfk20\@bath.ac.uk)]],
      [*Reviewers*], [],
      [*Created On*], [],
      [*Words*], [],
      [*Document Id*], [],
    )
    // Insert Changelog
    #if changelog != none [
      #changelog
    ]
  ]
  #pagebreak()

  // Insert the contents
  #outline(title: [Table of Contents])
  #pagebreak()

  // Dynamic List of Figures
  #context [
    // Query the document for all image figures
    #let image-figs = query(figure.where(kind: image))

    // Only render the section if the query found at least one image
    #if image-figs.len() > 0 [
      = List of Figures
      #outline(title: none, target: figure.where(kind: image))
    ]
  ]

  // Dynamic List of Tables
  #context [
    // Query the document for all table figures
    #let table-figs = query(figure.where(kind: table))

    // Only render the section if the query found at least one table
    #if table-figs.len() > 0 [
      = List of Tables
      #outline(title: none, target: figure.where(kind: table))
    ]
  ]
  // Dynamic List of Abbreviations
  = List of Abbreviations
  #context [
    #let acronym-data = query(<acronym>)
    #table(
      columns: (auto, 1fr),
      align: left + horizon,
      table.header([ *Abbreviation / Acronym* ], [ *Definition* ]),
      // dynamically map over the metadata stored in main.typ
      ..acronym-data.map(a => (a.value.abbrev, a.value.full)).flatten(),
    )
  ]
  #pagebreak()

  // ==========================================
  // MARK: MAIN BODY SETUP
  // ==========================================
  #set page(numbering: "1")
  #counter(page).update(1)
  #counter(heading).update(0)
  #set heading(numbering: "1.1")

  // Render the actual document body here
  #body

]

// ==========================================
// MARK: APPENDIX TEMPLATE
// ==========================================
#let appendix(body) = {
  pagebreak()
  counter(page).update(1)
  counter(heading).update(0)
  set heading(numbering: "A.1", supplement: "")

  // Render the appendix body here (No '#' needed)
  body
}
