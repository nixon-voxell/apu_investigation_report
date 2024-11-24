#import "monokai_pro.typ": *
#import "keywords.typ": *

#set text(font: "Times New Roman", size: 12pt, hyphenate: false)

#include "cover_page.typ"

#pagebreak()

#set page(
  header: context [
    #set text(size: 10pt, fill: base3)
    #place(bottom + right)[#counter(page).display("1")]
  ],
  footer: [
    #set text(size: 10pt, fill: base6)
    #place(top + left)[TP058994]
    #place(top + right)[Cheng Yi Heng]
  ],
)
#set par(justify: true, leading: 1em, spacing: 2em)
#set enum(indent: 1em)
#set table(inset: 6pt, stroke: 0.6pt)
#set raw(theme: "Monokai Pro.tmTheme")

#show heading: set block(height: 1.5em)
#show figure.caption: set text(style: "italic")
#show outline.entry.where(level: 1): it => {
  v(14pt, weak: true)
  strong(it)
}
#show raw.where(block: true): it => {
  set text(fill: base7, size: 8pt)
  box(it, fill: base0, inset: 1.5em, radius: 1em)
}
#show cite: it => {
  if it.form == "prose" {
    show "&": "and"
    it
  } else {
    it
  }
}

#align(center)[= Acknowledgement]

I would like to express my heartfelt gratitude to everyone who supported me throughout the development of the project.
First, I am deeply thankful to my teammates, whose dedication, collaboration, and creativity which were instrumental in bringing this project to life.
Their ability to work together, solve problems, and push boundaries made all the difference.

I also wish to extend my sincerest thanks to my supervisors, Mr. Jacob Sow Tian You and Assoc. Prof. Ts. Dr. Tan Chin Ike, for their invaluable guidance, insights, and encouragement throughout this journey.

I would also like to express my deepest gratitude to the open-source communities behind Bevy, Typst, and Linebender (Vello).
Their incredible work and commitment to open collaboration provided the tools, inspiration, and support that made this project possible.
The countless contributions, whether through libraries, documentation, or community discussions, were invaluable to overcoming technical challenges and advancing the development of the project.
I am profoundly grateful to have had the opportunity to learn from and contribute to them.

Finally, I would like to thank my family and friends for their unwavering support and belief in me, which provided the motivation I needed to persevere through challenges.
This project would not have been possible without each of you.

#pagebreak()

= Abstract
// Summary, Introduction, Methodology (purposive sampling, qualitative/quantitative), Expected result

Despite the widespread use of raster graphics in games, vector graphics remain underutilized and largely absent, with little integration and no established framework for their effective use in modern game development.
This project introduces #velyst, a streamlined framework for integrating interactive and dynamic vector graphics into real-time video games.
It leverages Typst for vector content creation and Vello for real-time rendering of dynamic vector graphics.
By simplifying the process, this framework enables developers to produce high-quality and engaging content without needing to delve deeply into technical complexities.
Our study employs purposive sampling to collect valuable insights from developers in the gaming and interactive application sectors.
We will conduct seven in-depth interviews with industry professionals to gain expert perspectives.
Additionally, online survey questionnaires will be distributed to a broader developer audience to capture a wider range of opinions.
This uncovers the challenges and opportunities of integrating vector graphics, with insights that contributes to the framework on reducing technical barriers, enhancing interactivity, and highlighting areas for further innovation in the field.
This research aims to demonstrate the untapped potential of vector graphics in modern gaming and provide a practical solution for their seamless integration.
Our approach contributes to advancing infrastructure and fostering innovation, aligning with the goals of _Sustainable Development Goal (SDG) 9_.

// Keywords - Max 6
_*Keywords*: Typesetting, Markdown, Workflow, Dynamic content, Compute-centric, Typst_

#place(bottom)[*SDG Goal 9: Build resilient infrastructure, promote inclusive and sustainable industrialization and foster innovation*]

#pagebreak()

#outline(indent: 1em)

#pagebreak()

#outline(title: "Figures", target: figure.where(kind: image))

#pagebreak()

#outline(title: "Tables", target: figure.where(kind: table))

#pagebreak()

#let heading_numbering(.., last) = [CHAPTER #last: ]
#set heading(numbering: "1.")
#show heading.where(level: 1): set heading(numbering: heading_numbering)
#show heading.where(level: 1): it => underline(it)
#set enum(numbering: "1.a.")

#include "introduction.typ"

#pagebreak()

#include "literature_review.typ"

#pagebreak()

#include "methodology.typ"

#pagebreak()

= Conclusion

Throughout this research, we have explored the evolution of vector graphics, examining its historical roots and tracing its development through to the current modern techniques.
This investigation has provided a comprehensive understanding of how vector graphics, from their early applications to today’s dynamic and interactive uses, continue to influence the design and performance of modern digital content.
On the other hand, research on UI/UX implementations shows the different ways of UI frameworks implementations, namely, IMGUI and RMGUI, with strength and weaknesses evaluated form both sides.
These insights will help us in developing a more robust framework for #velyst.
Finally, we also took a deep dive into the tools used in authoring UI elements using markup languages like HTML and CSS.
We concluded with Typst as the most suitable authoring tool for #velyst and Vello as the most efficient and future-proof renderer of vector graphics content.

From the surveys and interviews, we saw a common theme on the lack of robust tooling in terms of integration and flexibility.
Many developers expressed a desire for improved tools that can streamline the integration of vector and motion graphics into real-time applications and game engines.
Several challenges were highlighted, such as the lack of seamless interoperability between different platforms, the complexity of dynamic vector graphics integration, and the need for more flexible, customizable toolsets.
For instance, many participants pointed out that existing tools often require too much technical knowledge or have limitations in terms of performance and flexibility.

Additionally, the #lumina project, with its focus on dynamic, interactive environments, benefits greatly from these findings.
The combination of vector graphics, real-time interactivity, and UI/UX integration will play a crucial role in delivering a seamless and immersive user experience.
We intend to use these insights to refine #velyst further and explore more robust methods of incorporating dynamic vector content in both #lumina and other future projects.

Looking ahead, our expectations are focused on the research and development of #velyst into a robust and adaptable framework, one that can cater to the growing demands of modern game development and interactive applications.
With the integration of advanced vector graphic rendering techniques and improved UI/UX tools, we aim to make #velyst a cornerstone for developers working in dynamic, interactive environments, bringing vector graphics and motion graphics to the forefront of real-time applications.

#show heading.where(level: 1): set heading(numbering: "1.")

#pagebreak()

= References
#bibliography("citation.bib", style: "apa", title: none)

#pagebreak()

= Appendices

== PPF

#figure(caption: [Ethics Form 1])[
  #image("assets/ppf/ppf-01.png", width: 90%)
]

#for i in range(1, 15) {
  let idx = i + 1
  let str_idx = if idx < 10 {
    "0" + str(idx)
  } else {
    str(idx)
  }
  let file = "assets/ppf/ppf-" + str_idx + ".png"
  figure(caption: [PPF #idx])[
    #image(file)
  ]
}

#pagebreak()

== Ethics Form

#for i in range(0, 5) {
  let idx = i + 1
  let file = "assets/ethics/Fast-Track Form - Nixon Cheng-" + str(idx) + ".png"
  figure(caption: [Ethics Form #idx])[
    #image(file)
  ]
}

#figure(caption: [Disclaimer Form])[
  #image("assets/ethics/Disclaimer Form - Nixon Cheng-1.png")
]

== Log Sheets

#figure(caption: [Project log sheet 1])[
  #image("assets/logsheets/oct29.png")
]
#figure(caption: [Project log sheet 2])[
  #image("assets/logsheets/nov8-1.png")
]
#figure(caption: [Project log sheet 3])[
  #image("assets/logsheets/nov8-2.png")
]
#figure(caption: [Project log sheet 4])[
  #image("assets/logsheets/nov15.png")
]

#pagebreak()

== Gantt Chart

#figure(caption: "Gantt Chart")[
  #image("assets/gantt-chart.png")
]

