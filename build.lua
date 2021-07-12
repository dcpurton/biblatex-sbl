module = "biblatex-sbl"

unpackexe          = ""
sourcefiles        = {"*.def", "*.bib", "*.cbx", "*.bbx", "*.dbx", "*.lbx"}
installfiles       = {"*.def", "*.bib", "*.cbx", "*.bbx", "*.dbx", "*.lbx"}

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

