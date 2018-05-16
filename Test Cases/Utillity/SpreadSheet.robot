*** Settings ***
Library           ExcelLibrary
Library           String
Library           Collections

*** Test Cases ***
Read Data row by row
   Open Excel      users.xls
    ${cols}=    Get Column Count    Sheet1
    ${rows}=    Get Row Count      Sheet1         
  #${colVal}=      Get Row Values   Sheet1      4    include_empty_cells=false 
   Log To Console       Columns:${cols} - Rows:${rows}
   ${row3}=  Get Row Values    Sheet1   3
   #Log To Console       ${row3}
   ${x} =	Get From List	${row3}	0
  #Log To Console        ${x} 
    ${y}=       Get From List   ${x}    1 
    Log To Console        ${y} 
   