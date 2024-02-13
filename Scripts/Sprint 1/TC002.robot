*** Settings ***
Documentation     ทดสอบซื้อเสื้อ
Resource          resource.robot

*** Variables ***
${PERSONAL_INFO_FORM}  id=customer-form
${FIRST_NAME}          id=field-firstname
${LAST_NAME}           id=field-lastname
${EMAIL}               id=field-email
${PASSWORD}            id=field-password
${BIRTHDATE}           id=field-birthday
${NEWSLETTER}          name=newsletter
${TERMS_CHECKBOX1}    xpath=//*[@id="customer-form"]/div/div[8]/div[1]/span/label/input
${TERMS_CHECKBOX2}    xpath=//*[@id="customer-form"]/div/div[10]/div[1]/span/label/input
${TERMS_CHECKBOX3}    xpath=//*[@id="conditions_to_approve[terms-and-conditions]"]

${ADDRESS1}         field-address1
${ADDRESS2}         field-address2
${CITY}             field-city
${STATE}            field-id_state
${POSTCODE}         field-postcode
${COUNTRY}          field-id_country
${PHONE}            field-phone

*** Test Cases ***
Buy a shirt
    Open Browser To Index Page
    #Voucher
    Clicks    xpath=//*[@id="category-6"]/a

    Clicks    xpath=//*[@id="js-product-list"]/div[1]/div[3]

    #Add to cart
    Clicks    xpath=//*[@id="add-to-cart-or-refresh"]/div[2]/div/div[2]/button

    #Checkout in detail
    Clicks    xpath=//*[@id="blockcart-modal"]/div/div/div[2]/div/div[2]/div/div/a

    #Checkout in cart
    Clicks    xpath=//*[@id="main"]/div/div[2]/div[1]/div[2]/div/a

    #Fill user information
    Wait Until Element Is Visible    ${PERSONAL_INFO_FORM}
    Input Text    ${FIRST_NAME}    Somsri
    Input Text    ${LAST_NAME}     Jaidee
    Input Text    ${EMAIL}         somsri.jd12324555@kkumail.com
    Input Text    ${PASSWORD}      somsrijaideekku
    Input Text    ${BIRTHDATE}     01/02/1993
    Select Checkbox    ${NEWSLETTER}
    Select Checkbox    ${TERMS_CHECKBOX1}
    Select Checkbox    ${TERMS_CHECKBOX2}

    #Continue
    Clicks    xpath=//*[@id="customer-form"]/footer/button

    #Fill address information
    Input Text    id=${ADDRESS1}    KKU
    Input Text    id=${ADDRESS2}    1234
    Input Text    id=${CITY}        Khonkaen
    Select From List by Value    id=${COUNTRY}  204  # Selecting "Thailand"
    Input Text    id=${POSTCODE}    40000
 
    #Continue
    Clicks    //*[@id="checkout-addresses-step"]/div/div/form/footer/button

    #Continue
    Clicks    xpath=//*[@id="js-delivery"]/button
    Select Checkbox    ${TERMS_CHECKBOX3}

    #Place Order
    Clicks    xpath=//*[@id="payment-confirmation"]/div[1]/button