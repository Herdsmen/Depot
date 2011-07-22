require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    order = orders(:one)
    cart = (carts(:one))
    order.add_line_items_from_cart(cart)
    mail = Notifier.order_received(order)
    
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["Herdsmen108@gmail.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "order_shipped" do
    order = orders(:one)
    cart = (carts(:one))
    order.add_line_items_from_cart(cart)
    mail = Notifier.order_shipped(orders(:one))
    assert_equal "Pragmatic Store Order shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["Herdsmen108@gmail.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
