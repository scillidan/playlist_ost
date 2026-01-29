// Authors: DeepSeek🧙‍♂️, scillidan🤡

#let rawContent = read("Mushishi - Mushinone.mp3.chp")
#let processLines(text) = {
  let lines = text.split("\n")
  let processed = lines.map(line => {
    if line.len() > 9 {
      line.slice(9)
    } else {
      ""
    }
  })
  processed.join("\n")
}

#let content = processLines(rawContent)

#set page(
  paper: "a5",
  flipped: true,
  margin: 5%,
)
#set text(font: ("MonaspiceNe NFM", "Sarasa Mono SC"), size: 8pt)

#grid(
  columns: 2,
  gutter: 1em,
  [
    #block(
      width: 100%,
      height: 100%,
      grid(
        columns: 1,
        rows: (1fr, 1fr),
        gutter: 0.5em,
        align(center, box(
          width: 100%,
          height: 100%,
          stroke: 0.15pt + black,
          image("Mushishi - Mushinone Zen.jpg", width: 100%, height: 100%, fit: "contain"),
        )),
        align(center, box(
          width: 100%,
          height: 100%,
          stroke: 0.15pt + black,
          image("Mushishi - Mushinone Go.jpg", width: 100%, height: 100%, fit: "contain"),
        ))
      )
    )
  ],
  [
    #block(
      width: 100%,
      height: 100%,
      inset: (x: 1em, y: 1em),
      {
        text(size: 2.5em, weight: "bold", font: ("MonaspiceNe NFM", "Sarasa Mono SC"))[蟲音 前・後]
        linebreak()
        v(0.2em)
        text(size: 1.5em, weight: "medium", style: "italic")[増田俊郎, 2006]
        linebreak()
        v(1em)
        let lines = content.split("\n")
        let splitPoint = 23
        grid(
          columns: 2,
          gutter: 0.5em,
          [
            #text(size: 0.9em, style: "normal")[
              #lines.slice(0, splitPoint).join("\n")
            ]
          ],
          [
            #text(size: 0.9em, style: "normal")[
              #lines.slice(splitPoint).join("\n")
            ]
          ]
        )
      }
    )
  ]
)