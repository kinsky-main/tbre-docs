#import "@local/tbre-doc:0.1.0": template, appendix, abbrev, hl

// 1. Apply the main formatting to the document
#show: template.with(changelog: include "changelog.typ")

// You can log your abbreviations anywhere in the content or out of line here
#abbrev("TBRe", "Team Bath Racing Electric", inline: false)

#[
// 2. Apply black box grouping

= Introduction

]
#[] <end-main>
// 3. Apply appendix styling 

#show: appendix

= Appendix
Your first appendix goes here...

#[] <end-appendix>