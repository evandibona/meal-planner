local tex = {}

function capCase( s )
  local a = " "..s:lower()
  a = a:gsub(" %a", string.upper)
  return a
end

function tex.tableofcontents()
  print("\\newpage\n")
  print("\\vspace*{-3em}")
  print("{{\\tableofcontents}}")
  print("\\thispagestyle{empty}")
  print("\n\\newpage\n")
end

function tex.emptypage()
  print("\\thispagestyle{empty}")
end

function tex.p(s) 
  print(sanb(s).."\n") 
end

function tex.bq( s )
  print("\t\t\\begin{quote} "..s.."\\end{quote}\n")
end

function tex.hr()
  return  "\\begin{center}\n"..
          "\t\\rule{14em}{0.75pt}\n"..
          "\\end{center}\n\n"
end

function tex.flushleft( s )
  print("\t\\begin{flushleft}"..
         s.."\\end{flushleft}\n")
end

function tex.newpage() print("\\newpage") end

function tex.vspace( n, u )
  u = u or 'em'
  print("\\vspace{"..n..u.."}")
end
function tex.center( s )
  return "\\begin{center}"..s.."\\end{center}"
end

function tex.flushright( s )
  print("\t\\begin{flushright}"..
         s.."\\end{flushright}\n")
end

function tex.section(title)
  --print("\n\n\\newpage")
  print("\\thispagestyle{empty}")
  print("\\begin{center}")
  print("\t\\section*{"..title.."}")
  print("\\end{center}")
  print()
end

function tex.chapter(title)
  title = title or ""
  --print("\n\n\\newpage")
  print("\\thispagestyle{empty}")
  print("\\begin{center}")
  print("\t\\chapter{"..title.."}")
  print("\\end{center}")
  print()
end

function tex.blank()
	print("\\clearpage \\mbox{} \\thispagestyle{empty} \\clearpage")
end

return tex
