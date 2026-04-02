#import "@local/tbre-doc:0.1.0": template, appendix, abbrev, hl


#let creds-string = sys.inputs.at("credentials", default: none)

#let author-name = "Unknown Author"
#let author-email = "Unknown Email"

#if creds-string != none {
  let parsed = json(bytes(creds-string))
  author-name = parsed.name
  author-email = parsed.email
}

#show: template.with(
  title: "AI Compute Platform Description",
  doc-type: "Documentation",
  author: author-name,
  email: author-email,
  date: datetime(day: 30, month: 4, year: 2002),
  reviewers: (), 
  doc-id: "TBRe-2026-001", 
  changelog: include "changelog.typ",
  references: bibliography("refs.bib"),
  show-abbreviations: true,
  show-contents: true,
  show-lists: true,
)

// You can log your abbreviations anywhere in the content or out of line here
#abbrev("TBRe", "Team Bath Racing Electric", inline: false)

#[

= Major Heading

== Subheading

=== Sub-subheading

]
#[] <end-main>

#bibliography("refs.bib", title: none)

// Apply appendix styling 
#show: appendix

= Appendix
Your first appendix goes here...

#[] <end-appendix>