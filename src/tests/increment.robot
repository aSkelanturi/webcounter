*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Keywords ***
Reset Counter To Zero
    Go to  ${HOME_URL}
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Title Should Be  Laskuri
    Page Should Contain  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Reset Counter To Zero
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

Reset button works
    Reset Counter To Zero
    Click Button  Paina
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa

Setting a value works
    Reset Counter To Zero
    Input Text  value  10
    Click Button  Aseta
    Page Should Contain  nappia painettu 10 kertaa