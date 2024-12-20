require "application_system_test_case"

class BillingsTest < ApplicationSystemTestCase
  setup do
    @billing = billings(:one)
  end

  test "visiting the index" do
    visit billings_url
    assert_selector "h1", text: "Billings"
  end

  test "should create billing" do
    visit billings_url
    click_on "New billing"

    fill_in "Address", with: @billing.address
    fill_in "Fullname", with: @billing.fullname
    fill_in "Phone number", with: @billing.phone_number
    fill_in "Promotion", with: @billing.promotion_id
    fill_in "Total price", with: @billing.total_price
    click_on "Create Billing"

    assert_text "Billing was successfully created"
    click_on "Back"
  end

  test "should update Billing" do
    visit billing_url(@billing)
    click_on "Edit this billing", match: :first

    fill_in "Address", with: @billing.address
    fill_in "Fullname", with: @billing.fullname
    fill_in "Phone number", with: @billing.phone_number
    fill_in "Promotion", with: @billing.promotion_id
    fill_in "Total price", with: @billing.total_price
    click_on "Update Billing"

    assert_text "Billing was successfully updated"
    click_on "Back"
  end

  test "should destroy Billing" do
    visit billing_url(@billing)
    click_on "Destroy this billing", match: :first

    assert_text "Billing was successfully destroyed"
  end
end
