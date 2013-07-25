Carrousel = [
  {
    url: "/blog/post/50648443491/fabrique-en-q42-komen-als-grote-winnaars-van-de-dutch"
    bg: "/images/carrousel/DIA13.jpg"
    text: "3 DIA awards voor Rijksmuseum en Philips"
    en_text: "3 DIA awards for Rijksmuseum and Philips"
    pos: "right"
  }
  {
    url: "/blog/post/49503089620/q42-opent-vestiging-in-amsterdam"
    bg: "/images/carrousel/Q020.jpg"
    text: "Q42 opent vestiging in Amsterdam"
    en_text: "Q42 opens office in Amsterdam"
    pos: "right"
  }
  {
    url: "/blog/post/45861370772/q42-is-de-best-place-to-work-in-nederland"
    bg: "/images/carrousel/GPTW.jpg"
    text: "Q42 officieel dé Greatest Place to Work"
    en_text: "Q42 is officially the Greatest Place to Work"
    pos: "left"
  }
]

Template.carrousel_items.item = -> Carrousel
Template.carrousel_items.pos = -> @pos || "right"
Template.carrousel_items.url = ->
  if @en_url and Session.equals "lang", "en"
    @en_url
  else
    @url
Template.carrousel_items.text = ->
  if @en_text and Session.equals "lang", "en"
    @en_text
  else
    @text
Template.carrousel_items.bg = ->
  if @en_bg and Session.equals "lang", "en"
    @en_bg
  else
    @bg

Template.carrousel_items.todaysDate = -> moment().format("YYYY-MM-DD")

Template.carrousel_items.events =
  "mouseover #quento": ->
    window.showreelPaused = yes
  "mouseout #quento": ->
    window.showreelPaused = no