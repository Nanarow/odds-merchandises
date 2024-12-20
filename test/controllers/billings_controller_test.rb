require "test_helper"

class BillingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @billing = billings(:one)
  end

  test "should get index" do
    get billings_url
    assert_response :success
  end

  test "should get new" do
    get new_billing_url
    assert_response :success
  end

  test "should create billing" do
    assert_difference("Billing.count") do
      post billings_url, params: { billing: { address: @billing.address, fullname: @billing.fullname, phone_number: @billing.phone_number, promotion_id: @billing.promotion_id, total_price: @billing.total_price } }
    end

    assert_redirected_to billing_url(Billing.last)
  end

  test "should show billing" do
    get billing_url(@billing)
    assert_response :success
  end

  test "should get edit" do
    get edit_billing_url(@billing)
    assert_response :success
  end

  test "should update billing" do
    patch billing_url(@billing), params: { billing: { address: @billing.address, fullname: @billing.fullname, phone_number: @billing.phone_number, promotion_id: @billing.promotion_id, total_price: @billing.total_price } }
    assert_redirected_to billing_url(@billing)
  end

  test "should destroy billing" do
    assert_difference("Billing.count", -1) do
      delete billing_url(@billing)
    end

    assert_redirected_to billings_url
  end
end
