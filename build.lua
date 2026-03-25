module = "biblatex-sbl"

unpackexe        = ""
sourcefiles      = {"*.def", "*.bib", "*.cbx", "*.bbx", "*.dbx", "*.lbx"}
installfiles     = {"*.def", "*.cbx", "*.bbx", "*.dbx", "*.lbx"}
typesetfiles     = {"biblatex-sbl.tex"}
typesetdemofiles = {"biblatex-sbl-blog-examples.tex",
                    "biblatex-sbl-studentsupplement-examples.tex",
                    "biblatex-sbl-handbook-examples.tex"}
typesetsuppfiles = {"biblatex-sbl-examples-preamble.tex"}

typesetexe = "lualatex"

stdengine    = "luatex"
checkengines = {"luatex"}
checkruns    = 3

function runtest_tasks (name, run)
  if run <= 2 then
    return "biber -q " .. name
  else
    return "exit 0"
  end
end

tagfiles = {"biblatex-sbl.tex", "biblatex-sbl.def", "README.md"}

function update_tag(file, content, tagname, tagdate)
  content = content:gsub(
    "(\\date%{)%d%d%d%d%-%d%d%-%d%d%s+v[%d%.%a]+(%})",
    "%1" .. tagdate .. " v" .. tagname .. "%2"
  )

  content = content:gsub(
    "(\\def\\sbl@abx@date%{)%d%d%d%d%-%d%d%-%d%d(%})",
    "%1" .. tagdate .. "%2"
  )

  content = content:gsub(
    "(\\def\\sbl@abx@version%{)[%d%.%a]+(%})",
    "%1" .. tagname .. "%2"
  )

  content = content:gsub(
    "(Copyright %([Cc]%) %d%d%d%d%-)%d%d%d%d",
    "%1" .. tagdate:sub(1, 4)
  )

  return content
end
