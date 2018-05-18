Get HTTPS & Verify Cert with a CA bundle
    [Tags]  get
    Create Session    httpbin    https://httpbin.org   verify=${CURDIR}${/}cacert.pem
    ${resp}=  Get Request  httpbin  /get
    Should Be Equal As Strings ${resp.status_code} 200