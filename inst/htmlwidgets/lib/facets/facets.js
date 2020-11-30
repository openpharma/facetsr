if (window.jQuery) $.holdReady(true)
let facets = document.createElement('link')
facets.rel = 'import'
facets.href = `https://raw.githubusercontent.com/PAIR-code/facets/a29e256743a9e61c307973293e1b7054ff527fe8/facets-dist/facets-jupyter.html`
facets.onload = function() {
  if (window.jQuery) $.holdReady(false)
}
document.head.appendChild(facets)
