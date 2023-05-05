Feature: MyStore Testlab
  Scenario: Add new address
    Given Page "https://mystore-testlab.coderslab.pl/index.php" open
    And right Button Sign in clicked
    And Email "sss" and Password "sss" filled
    And sign in page Button Sign In clicked
    And Button Addresses clicked
    When Button Create new address clicked
    And Alias "alias" filled
    And Company "company" filled
    And Vat number "vat" filled
    And Address "address" filled
    And Address Complement "address2" filled
    And City "city" filled
    And Zip/Postal Code "04-000" filled
    And Country "UK" filled
    And Phone "500 000 000" filled
    And Button Save Clicked
    Then Check if address is correct
    And delete the address
    And check if adress is removed

#  będzie logować się na tego stworzonego użytkownika,
#  wejdzie klikając w kafelek Addresses po zalogowaniu (adres, na którym powinniśmy się znaleźć to: https://mystore-testlab.coderslab.pl/index.php?controller=addresses ),
#  kliknie w + Create new address,
#  wypełni formularz New address - dane powinny być pobierane z tabeli Examples w Gherkinie (alias, address, city, zip/postal code, country, phone),
#  sprawdzi czy dane w dodanym adresie są poprawne.

  Scenario: Buy some things
    Given Logged with same creditentials
    And Hummingbird Printed Sweater Clicked
    When checked if discount is 20%
    And choose the "M" size (choose any size)
    And choose "5" pieces of it
    And add to cart
    And went to checkout
    And Confirm address
    And choose Presta Shop Pick up in store
    And choose Pay by Check
    Then clicked Order with an obligation to pay
    And make ss of order confirmation and price

    Scenario: Checking if "awaiting check payment"
      Given Logged with same creditentials
      And Button logged user clicked
      When Order history clicked
      Then Check if order on hummingbird sweaters is there with status awaiting check payment and price "22" same as earlier

