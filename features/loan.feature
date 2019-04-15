@all
Feature: Fill out the online application to get a loan decision
  @pre_q_loan
  Scenario: Pre-qualification form for loan
    Given I land on "Loan" application page
    Then I enter "Salim" in the "First" name field
    And I enter "Qodirov" in the "Last" name field
    Then I enter "myemail@gmail.com" in the "Email" field
    And I enter "6505556666" in the "Phone" field
    And I enter "01011990" in the "Birthdate" field
    When I click on "Next" button
    Then I should navigate to the "Address Information" page
    And I select "Rent" from the "Applicant-residence-type" dropdown
    And I enter "123 Main Str." in the "Street-address" field
    And I enter "San Jose" in the "City" field
    Then I select "CA" from the "Applicant-state" dropdown
    And I enter "95110" in the "Zip-Code" field
    Then I enter "4000" in the "Residence-monthly-payment" field
    And I enter "5000" in the "Employment-income" field
    When I click on "Next" button
    Then I should navigate to the "Terms and Conditions" page
    When I click on "I agree" button
    Then I should navigate to the "We need more information" page
    And I enter "823478337" in the "Social-security-number" field
    When I click on "Next" button
    Then I should navigate to the "Sorry, unable to find a loan." page

  @pre_q_refinance
  Scenario: Pre-qualification form for refinance
    Given I land on "Refinance" application page
    Then I enter "Salim" in the "First" name field
    And I enter "Qodirov" in the "Last" name field
    Then I enter "myemail@gmail.com" in the "Email" field
    And I enter "6505556666" in the "Phone" field
    And I enter "01011990" in the "Birthdate" field
    When I click on "Next" button
    Then I should navigate to the "Address Information" page
    And I select "Rent" from the "Applicant-residence-type" dropdown
    And I enter "123 Main Str." in the "Street-address" field
    And I enter "San Jose" in the "City" field
    Then I select "CA" from the "Applicant-state" dropdown
    And I enter "95110" in the "Zip-Code" field
    Then I enter "4000" in the "Residence-monthly-payment" field
    And I enter "5000" in the "Employment-income" field
    When I click on "Next" button
    Then I should navigate to the "Vehicle Information" page
    And I select "2016" from the "Vehicle-year" dropdown
    And I select "BMW" from the "Vehicle-make" dropdown
    And I select "3 Series" from the "Vehicle-model" dropdown
    And I select "320i Sedan 4D" from the "Vehicle-trim" dropdown
    And I enter "30000" in the "Mileage" vehicle mileage field
    When I click on "Next" button
    Then I should navigate to the "Terms and Conditions" page
    When I click on "I agree" button
    Then I should navigate to the "We need more information" page
    And I enter "823478337" in the "Social-security-number" field
    When I click on "Next" button
    Then I should navigate to the "Sorry, unable to find a loan." page

# Same scenario but using scenario outline (data-driven)
  @pre_q_loan_outline
  Scenario Outline: Pre-qualification form for loan
    Given I land on "Loan" application page
    Then I enter "<first_name>" in the "First" name field
    And I enter "<last_name>" in the "Last" name field
    Then I enter "<email>" in the "Email" field
    And I enter "<phone_number>" in the "Phone" field
    And I enter "<birthday>" in the "Birthdate" field
    When I click on "Next" button
    Then I should navigate to the "Address Information" page
    And I select "<residence_type>" from the "Applicant-residence-type" dropdown
    And I enter "<street_address>" in the "Street-address" field
    And I enter "<city>" in the "City" field
    Then I select "CA" from the "Applicant-state" dropdown
    And I enter "<zip_code>" in the "Zip-Code" field
    Then I enter "<residence_monthly_payment>" in the "Residence-monthly-payment" field
    And I enter "<monthly_income>" in the "Employment-income" field
    When I click on "Next" button
    Then I should navigate to the "Terms and Conditions" page
    When I click on "I agree" button
    Then I should navigate to the "We need more information" page
    And I enter "<ssn>" in the "Social-security-number" field
    When I click on "Next" button
    Then I should navigate to the "Sorry, unable to find a loan." page
    Examples:
    |first_name|last_name|email               |phone_number|birthday|residence_type|street_address|city         |zip_code |residence_monthly_payment|monthly_income|ssn       |
    |Salim     |Qodirov  |myemail@gmail.com   |6509993322  |01011990|Rent          |123 Main str. |San Jose     |95110    |2000                     |5000          |212337787 |
    |Bruce     |Young    |byoung@gmail.com    |4559831888  |02021990|Own           |222 Park Ave. |San Francisco|94040    |1500                     |4000          |938199291 |
    |James     |Peterson |jpeterson@gmail.com |4375784939  |12021989|Other         |8911 Pine str.|Los Angeles  |92003    |1233                     |3550          |993839820 |

  @negative_pre_q_loan
  Scenario: Negative test case for pre-qualification form (Loan)
    Given I land on "Loan" application page
    When I click on "Next" button
    Then I should see an error for all required fields in the Get Started page
    Then I enter "Salim" in the "First" name field
    And I enter "Qodirov" in the "Last" name field
    Then I enter "myemail@gmail.com" in the "Email" field
    And I enter "6505556666" in the "Phone" field
    And I enter "01011990" in the "Birthdate" field
    When I click on "Next" button
    Then I should navigate to the "Address Information" page
    When I click on "Next" button
    Then I should see an error for all required fields in the Address Information page
    And I select "Rent" from the "Applicant-residence-type" dropdown
    And I enter "123 Main Str." in the "Street-address" field
    And I enter "San Jose" in the "City" field
    Then I select "CA" from the "Applicant-state" dropdown
    And I enter "95110" in the "Zip-Code" field
    Then I enter "4000" in the "Residence-monthly-payment" field
    And I enter "5000" in the "Employment-income" field
    When I click on "Next" button
    Then I should navigate to the "Terms and Conditions" page
    When I click on "I agree" button
    Then I should navigate to the "We need more information" page
    When I click on "Next" button
    Then I should see an error for all required fields in the More Information page
    And I enter "823478333" in the "Social-security-number" field
    When I click on "Next" button
    Then I should navigate to the "Sorry, unable to find a loan." page








