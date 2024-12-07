# Have had best luck by moving the VS config and using absolute path
Copy-Item -Path .\vsconfig.json -Destination c:\\vsconfig.json -Force
winget install --id Microsoft.VisualStudio.2022.Professional --override "--passive --wait --allowUnsignedExtensions --config c:\\vsconfig.json"

# The AddAnyFile extension shortcut Shift+F2 might be broken
# https://marketplace.visualstudio.com/items?itemName=MadsKristensen.AddNewFile64&ssr=false#qna
# The command to assign Shift+F2 is ProjectandSolutionContextMenus.Project.Add.NewEmptyFile

# Install ReSharper after VS install
winget install -h -e JetBrains.ReSharper