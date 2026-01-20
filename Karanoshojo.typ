// Authors: DeepSeek🧙‍♂️, scillidan🤡

#let rawContent = read("Karanoshojo.mp3.chp")
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
        image("Karanoshojo.jpg", width: 100%, height: 100%, fit: "contain"),
      )),
    )
  ],
  [
    #block(
      width: 100%,
      height: 100%,
      inset: (x: 1em, y: 1em),
      {
        text(size: 2.3em, weight: "bold", font: ("MonaspiceNe NFM", "Sarasa Mono SC"))[虚ノ少女\ オリジナルサウンドトラック]
        linebreak()
        v(0.2em)
        text(size: 1.5em, weight: "medium", style: "italic")[2013]
        linebreak()
        v(1em)
        let lines = content.split("\n")
        let splitPoint = 30
        grid(
          columns: 2,
          gutter: 0.5em,
          [
            #text(size: 0.8em, style: "normal")[
              #lines.slice(0, splitPoint).join("\n")
            ]
          ],
          [
            #text(size: 0.8em, style: "normal")[
              #lines.slice(splitPoint).join("\n")
            ]
          ]
        )
      }
    )
  ]
)