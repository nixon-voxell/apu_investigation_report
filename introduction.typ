#import "@preview/nth:1.0.1": *
#import "keywords.typ": *

#let my-date(date) = (
  nth(date.day(), sup: true) + date.display(" of [month repr:long] [year]")
)

= INTRODUCTION <intro>

== Introduction

// Chapter 1 of the report is an important chapter since it describes the overall project and its outcome.
// As this is the first chapter that the evaluators will read, it is essential to make a good first impression.
// It is important to write a chapter that clearly explains the project's flow.
// A thorough understanding of the ground work is necessary in order to write a well-written chapter.

// Achieving visually rich and interactive content in real-time without compromising performance is a key aspect of enhancing player engagement.
// This project addresses two major challenges in modern game development: creating dynamic, interactive user experiences and implementing accurate, real-time lighting models.
// Tackling these challenges requires two key innovations: a compute-centric vector graphics renderer and a programmable approach for developing interactive content.

*Vector graphics* is a form of computer graphics where visual images are generated using mathematical formulae @rick2024vector.
This includes geometric shapes, such as points, lines, curves, and polygons that are defined on a Cartesian plane.
The use of vector graphics in games can be tracked way back to when computer games was first developed.
One of the earliest examples of video game, _Tennis for Two_ as shown in @tennis-for-two uses vector graphics to render their game on a repurposed oscilloscope in 1958 @historyofgames2023.
It was not long before video games was first commercialized during the 1970s and 1980s, with the release of vector graphics rendered games like _Space Wars_ #cite(<spacewar1997>, form: "prose"), _Battlezone_ #cite(<battlezone1980>, form: "prose"), and _Tac/Scan_ #cite(<tagscan1982>, form: "prose").
These games showcases the potential of vector-based visuals to achieve fluid and interactive animations.

#figure(
  image("assets/Tennis for Two.png"),
  caption: [Tennis for Two @tennis1958],
) <tennis-for-two>

Around this time, graphical processing units (GPU) were also experiencing rapid development and growth.
In 1989, Silicon Graphics Inc. (SGI) created one of the earliest graphics application programming interfaces (API) OpenGL, which forms the foundation of today’s computer graphics software @evolutiongpu2004.
As GPU advanced, support for raster graphics improved significantly, leading to a decline in the use of vector-based rendering technology in gaming @vectoringaming.

Despite the rise of raster graphics, the unique benefits of vector graphics (scalability and precision) continue to offer significant potential in modern game environments.
Today, vector graphics are rendered using high resolution monitors through the process of rasterization @tian2022survey.
This necessity led to the rise of algorithms specifically designed to convert mathematically defined shapes into pixels, creating a new domain of computational challenges.
In addition, there is little to no tool available that effectively integrates vector graphics content into real-time, interactive game environments.
The absence of such tools has hindered the widespread adoption of vector graphics in modern game development, limiting their use to methods like triangulation @drawinglines2015 and sign distance field @alvin2020rendering due to technical constraints.

== Problem Statement

=== Scalability, precision, and animation

#figure(caption: [Vector vs Bitmap graphics @arneratermanis2017])[#image(
    "assets/vector-vs-raster.png",
    width: 90%,
  )] <vector-vs-raster>

Traditional methods of rendering 2D graphics has always relied on bitmap-based texture mapping @ray2005vector.
While this approach is ubiquitous, it suffers a major drawback of the _pixelation_ effect when being scaled beyond the original resolution @nehab2008random.
Furthermore, creating animations using bitmap-based textures can be extremely limited and complex because of the rigid grid-like data structure used to store the data.
Animating raster graphics are commonly done through the use of fragment shaders which directly manipulates individual pixels @jeremias2014shadertoy, or relying on image sequences (a.k.a flipbooks) @flipbook2016 which produces an illusion of movement.

Unlike raster graphics which rely on a fixed grid of pixels, vector graphics are precise and resolution independent.
This means that it can scale without losing quality (shown in @vector-vs-raster).
A vector illustration is composed of multiple _paths_ that define _shapes_ to be painted in a given order @ganacim2014massively.
Each of these individual paths can be traced, altered, or even morphed into a completely different shape which allows for a huge variety of animation techniques in real-time @mateja2023animatesvg @dalstein2015vector @carlier2020deepsvg.
Vector graphics animations can also react to dynamic runtime changes as the very definition of their shapes are extremely flexible.
This property allows vector animations to be generated procedurally instead of relying on pre-recorded data @svganimation.

=== Lack of support on UI/UX creation for complex interactivity

WYSIWYG editors are visual centric tools that let users work directly within the presentation form of the content @madje2022programmable.
Most game engines in the market like Unity @jacobsen2023, Unreal Engine @unrealui2023, and Godot @godotui2024 uses a _What You See Is What You Get_ (WYSIWYG) editor for creating user interfaces (UI) and user experiences (UX).
In WYSIWYG editors, users normally layout their contents using a drag and drop method and then style them using a style-sheet @wysiwyg2023.
To bind interactions or animations towards a content, users would need to label it with a unique tag and query them through code.

Complex content and logic would not be possible through a typical WYSIWYG editor.
For instance, it is virtually impossible to author a custom polygon shape in the editor with custom math based animation which depends on a time value.
This can only be achieved through code, and is often limited by the application programming interface (API) layer provided by the WYSIWYG editor.
This creates a huge distinction between the game/UI logic and the visual representation that is needed to convey the messages.

=== Slow iteration time and feedback loops in development

While hot-reloading is applicable for the layout and styling (and simple logic to some extend) of a content.
In an Unreal Engine UI tutorial titled "UMG Best Practices" by #cite(<umgpractices2019>, form: "prose"), the author concluded that logic should be kept in the C++ language and Unreal Blueprints.
It showcases that a WYSIWYG editor would not be capable of hot-reloading complex logic as these can only be achieved using code, which in most cases, requires a re-compilation.
This could lead to frustration and lost of creativity due to the slow feedback loop.

== Project Aim

This project aims to establish a framework that enables the integration of interactive and dynamic vector graphics into real-time video games, examining its potential to enhance visual quality, scalability, and interactivity within modern game environments.

== Research Objectives
// A minimum of three objectives and a maximum of four.
// Must be measurable

+ To assess the impact of vector graphics on visual quality, performance, and player experience in real-time games.
+ To design a framework that integrates vector graphics into real-time game environments, focusing on dynamic interactivity.
+ To identify and address the technical challenges and computational requirements needed for efficient real-time rendering of dynamic vector graphics.

== Research Questions
// Related to objectives

+ What is the impact of using vector graphics on the visual quality, performance, and overall player experience in real-time games?
+ How can vector graphics be efficiently integrated into real-time game environments to enhance dynamic interactivity?
+ What are the technical challenges and computational requirements associated with rendering dynamic vector graphics in real-time?

== Scope
// Describes in detail tasks to be executed.
// Constraints regarding any part of the project development (e.g. size of system and technology).
// What will and will not be done as part of the project.

The scope of this project invovles making a game that utilizes #velyst.
The creation of the game will help ensure that #velyst is production ready by the end of this project.

#figure(caption: "Scope")[
  #table(
    columns: (auto, 1fr),
    align: left,
    [#velyst], [An interactive Typst content creator using Vello and Bevy.],
    [#lumina], [A 2D top down fast paced objective based PvPvE game.],
  )
]

=== Tasks to be executed:

+ Develop the #velyst crate.
  + Develop an integrated compiler for Typst content in Bevy.
  + Support hot-reloading of Typst content.
  + Support interactivity between Bevy and Typst.
  + Develop an easy-to-use framework for UI creation using Typst.
  + Support in-game textures using vector graphics content (e.g. using vector graphics texture for a crate in the game).
  + Write up a getting started documentation to make on-boarding easier for new developers.

+ Develop the #lumina game.
  + Create a game design document (GDD) for the game.
  + Integrate #velyst into the game.
  + Develop all the required game mechanics for the game.
  + Playtest the game and gather player feedbacks on the game.

=== Constraints

#figure(caption: "Constraints")[
  #table(
    columns: (auto, 1fr),
    align: left,
    table.header([Constraint], [Reason]),
    [*Compatibility*],
    [
      Our project uses multiple cutting-edge and innovative technologies.
      This means that some of the technologies we depend on might be experimental or have yet to stabilize.
      This makes it difficult to ensure cross platform / device compatibility for the systems we built.
      For example, Vello requires compute shaders to render vector graphics, which means it can only runs on newer versions of browsers that supports WebGPU.
    ],

    [*Limited\ Documentation*],
    [
      Because some of the technologies we use are experimental or less widely adopted, available documentation and community support may be limited.
      This slows down the development process as issues can be difficult to troubleshoot without established resources.
    ],

    [*Limited Resource*],
    [
      The project is subject to limitations in terms of budget, personnel, and time.
      Allocating sufficient resources to develop, test, and refine the workflow for real-time vector graphics is crucial.
      Any constraints in these areas can impact the project's scope and delivery timeline.
    ],

    [*Vector Graphics\ Constraint*],
    [
      It is crucial to recognize that while vector graphics offer numerous benefits, it is only suitable for representing precise shapes --- such as fonts, logos, and icons.
      In contrast, complex images with intricate details, like a photograph of a cat are far better represented using bitmap formats.
    ],
  )
]

=== What will be done in this project:

+ *Typst compiler*:
  A custom implementation of Typst compiler will be created to fit the purpose of real-time Typst content rendering.
  This compiler should be able to re-compile Typst content on demand, allowing developers to view reflect their saved changes immediately.

+ *Vector graphics renderer*:
  The #velyst crate will allow users to generate dynamic vector graphics content which is then rendered through the Vello renderer.

+ *Game demo prototype*:
  #lumina will be developed to showcase all of the above in a compact game format.
  Players will experience realistic and beautiful 2D lighting, as well as interactive vector graphics UI elements.

=== What will not be done in this project:

+ *Not creating an animation library*:
  An animation library involves preparing a huge variety of common animation effects.
  This takes a huge amount of time which does not fit the goal and scope of this project.
  To understand more about animation libraries, we strongly encourage you to look into the _Bevy MotionGfx_ project.

+ *No visual editors*:
  It is possible to blend the Typst language with some form of visual editors, where the output would be a Typst function that takes in input parameters and produces a dynamic output content.
  However, our main focus for this project is to address the shortcomings of modern WYSIWYG editors.
  A feature as described would only be applicable after #velyst becomes a viable solution.

+ *Not a commercial game*:
  Our goal with #lumina is to create a game that demonstrates #velyst.
  It is not meant to be on par with a full on commercial game.

== Potential Benefit

=== Tangible Benefit

+ *Reduced asset size and load times*: The framework enables the use of vector graphics, which often require less storage space compared to traditional raster assets.
  This can result in smaller game asset sizes and improved load times, which can be quantitatively measured, providing concrete evidence of improved performance.
+ *Enhanced visual adaptability and resolution independence*: Vector graphics allow for high-quality visuals at any resolution, ensuring graphics remain crisp on various screen sizes and devices.
  This adaptability can be measured through resolution testing, demonstrating consistent visual quality across platforms.
+ *Improved development efficiency*: By streamlining the workflow, the framework reduces the time and resources needed for asset creation and rendering.
  Features like programmable content and hot-reloading can lead to faster development cycles and lower costs, measurable through development time tracking and cost analysis.

=== Intangible Benefit

+ *Increased creative freedom for developers*: The framework encourages developers to experiment with dynamic and interactive visuals, promoting creativity and innovation in game design.
  Although challenging to quantify, this freedom can result in more unique and engaging gameplay experiences, contributing to industry innovation.
+ *Enhanced player immersion and engagement*: By enabling smooth, responsive graphics, the framework enhances the overall visual appeal and interactive feel of games, potentially increasing player engagement and immersion.
  This contributes to player satisfaction, though it is difficult to measure directly.
+ *Long-term industry shift toward versatile graphics approaches*: The adoption of this framework may drive a gradual shift toward broader vector graphics usage in game development, promoting a more adaptable approach to graphics.
  Although this industry impact may not be immediately measurable, it contributes to evolving standards in visual and interactive design within games.

=== Target User

#velyst will particularly be targeted towards UI/UX developers, motion graphics creators, and vector graphics enthusiasts.
Because #velyst is built on top of Rust and Bevy, the general users will come from the Rust and Bevy community.

As for #lumina, the target audience are gamers who loves fast paced multipalyer games like _Apex Legends_ and _Astro Duel 2_.
It will particularly appeal to gamers who love the mix of competitive PvP and PvE like _Destiny 2_′s Gambit game mode and _World War Z_.

== Overview of the IR

This investigation report explores the establishment of a framework for integrating interactive and dynamic vector graphics in real-time video games. The project begins by providing a comprehensive introduction, outlining the context and background of the problem, where vector graphics, despite their scalability and precision, remain underutilized in modern game environments. This is followed by an articulation of the research aim, objectives, and scope, along with the potential benefits of the study. The introductory section concludes with an overview of the research design and project plan, setting the stage for a systematic investigation into the viability and advantages of vector graphics in real-time gaming contexts.

The literature review, presented in Chapter 2, delves into domain-specific research and technical explorations relevant to vector graphics and their application in game development. This section examines similar systems and related technologies, allowing for a comparison of existing approaches and identifying gaps within the current state of the art. Additionally, technical research focuses on the computational and algorithmic challenges posed by real-time vector graphics rendering, which informs the subsequent methodology and framework design. This chapter concludes with a summary that synthesizes the key insights from the literature, shaping the foundation for the methodological approach.

In Chapter 3, the methodology outlines the structured approach taken to develop and validate the proposed framework. Beginning with an introduction to the selected software development methodology (SDM) and its phases, this section describes the data gathering methods used to collect feedback from game developers and interactive application creators. This includes the design and execution of questionnaires and interviews, aimed at gathering insights on the practical demands and potential impacts of vector graphics within the industry. The methodology further explains the criteria for analysis, establishing a rigorous basis for interpreting the collected data.

Chapter 4 presents the findings from the questionnaire and interview analyses, examining trends, challenges, and developer preferences for integrating vector graphics in real-time environments. These results inform the conclusions drawn in the final section, where the potential of vector graphics in game development is assessed alongside the strengths and limitations of the proposed framework. The report closes with reflections on the study's contributions, limitations, and possible directions for future research, suggesting a pathway toward broader adoption and innovation in vector-based graphics in gaming.

#pagebreak()

== Project Plan
#[
  #set par(justify: false)

  #let plan(start_date, tasks: ((name: content, days: int))) = {
    let date = start_date
    let contents = ()

    for task in tasks {
      contents.push([#task.name])
      contents.push([#task.days])
      contents.push([#my-date(date)])
      date += duration(days: task.days - 1)
      contents.push([#my-date(date)])
      date += duration(days: 1)
    }

    (contents, date)
  }

  #let date = datetime(year: 2024, month: 9, day: 9)
  #let (ppf_plans, date) = plan(
    date,
    tasks: ((name: [Project Proposal Form], days: 14),),
  )

  #let (intro_plans, date) = plan(
    date,
    tasks: (
      (name: [Introduction], days: 2),
      (name: [Problem Background], days: 2),
      (name: [Project Aim], days: 1),
      (name: [Objectives], days: 1),
      (name: [Scope], days: 1),
      (name: [Potential Benefits], days: 1),
      (name: [Overview of IR], days: 1),
      (name: [Project Plan], days: 1),
    ),
  )

  #let (litrev_plans, date) = plan(
    date,
    tasks: (
      (name: [Introduction to LR], days: 1),
      (name: [Domain Research], days: 8),
      (name: [Similar System], days: 3),
      (name: [Technical Research], days: 5),
      (name: [Summary], days: 1),
    ),
  )

  #let (method_plans, date) = plan(
    date,
    tasks: (
      (name: [Introduction of SDM], days: 1),
      (name: [Phases of SDM], days: 2),
      (name: [Data Gathering Design], days: 6),
      (name: [Research Methodology], days: 2),
      (name: [Design of Questionnaire], days: 3),
      (name: [Design of Interview], days: 3),
      (name: [Analysis of Questionnaire], days: 3),
      (name: [Analysis of Interview], days: 3),
      (name: [Summary], days: 1),
    ),
  )

  #let (conclusion_plans, date) = plan(
    date,
    tasks: ((name: [Conclusion], days: 2),),
  )

  #figure(caption: "Project Plan")[
    #table(
      columns: (auto, auto, auto, auto),
      align: (left, center, left, left),
      table.header(
        [*Task Name*],
        [*Duration\ #text(size: 0.8em)[(Day)]*],
        [*Start Date*],
        [*End Date*],
      ),

      ..ppf_plans,

      table.cell(colspan: 4, align: center)[Chapter 1: Introduction],

      ..intro_plans,

      table.cell(colspan: 4, align: center)[Chapter 2: Literature Review],

      ..litrev_plans,

      table.cell(colspan: 4, align: center)[Chapter 3: Methodology],

      ..method_plans,

      table.cell(
        colspan: 4,
        align: center,
      )[Chapter 4: Conlusion and Reflections],

      ..conclusion_plans,
    )
  ]
]