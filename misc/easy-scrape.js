	// fatsecret.com

var macros = $('td.fact div.factValue').map(function(){
  return $(this).text().replace("g","")
}).get()

var ingr = $('div.summarypanelcontent h1').text()
var sval = $('td.serving_size_value').text()
  .split(", ")[0].split(" ")
var unit = sval[1].trim()
var quant = sval[0].trim()
macros[0] = macros[0].trim()
macros[1] = macros[1].trim()
macros[2] = macros[2].trim()
macros[3] = macros[3].trim()
console.log(
  "\n\n,",
  quant,",\t",unit,",\t",macros[3],",\t",macros[1],",\t",macros[2],
  "\n\n"
)

