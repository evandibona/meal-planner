// fatsecret.com

var macros = $('td.fact div.factValue').map(function(){
  return $(this).text().replace("g","")
}).get()

var ingr = $('div.summarypanelcontent h1').text()
var sval = $('td.serving_size_value').text()
	.split(", ")[0].split(" ")
var unit = sval[1]
var quant = sval[0]
console.log(
	"\n\t{",
  "\n\t\t","n = " + "'" + ingr + "'"+",",
  "\n\t\t","s="+quant+",u='"+unit+"',",
  "\n\t\t","cal = " + macros[0]+",",
  "\n\t\t","pro = " + macros[1]+",",
  "\n\t\t","fat = " + macros[2]+",",
  "\n\t\t","crb = " + macros[3]+",",
  "\n\t},"
)
