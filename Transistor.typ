// Authors: DeepSeek🧙‍♂️, scillidan🤡

#let rawContent = read("Transistor.mp3.chp")
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
      align(center, box(
        width: 100%,
        height: 100%,
        stroke: 0.15pt + black,
        image("Transistor.jpg", width: 100%, height: 100%, fit: "contain"),
      )),
    )
  ],
  [
    #block(
      width: 100%,
      height: 100%,
      inset: (x: 1em, y: 1em),
      {
        text(size: 2.5em, weight: "bold", font: ("MonaspiceNe NFM", "Sarasa Mono SC"))[Transistor]
        linebreak()
        v(0.2em)
        text(size: 1.5em, weight: "medium", style: "italic")[2014]
        linebreak()
        v(1em)
        text(size: 1.1em, style: "normal")[
          #content
        ]
      }
    )
  ]
)