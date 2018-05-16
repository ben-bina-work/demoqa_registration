*** Variables ***
${txtFirstName}    id=name_3_firstname
${txtLastName}    id=name_3_lastname
${lblTestLabel}    xpath=//*[@id="registerForm"]/div[4]/div[1]/h2
${requiredValidationMessage}    xpath=//*[contains(text(),'* This field is required')]
${radioButtons}    //*[@type="radio"]
${selectedRadio}    //input[@value='${optionValue}']
${optionValue}    divorced
