class Notifier < ActionMailer::Base
  default :from => "Herdsmen108@gmail.com"
  #default :body => "1 x Programming Ruby 1.9"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order
    mail :to => order.email
    mail :subject => 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @greeting = "Hi"
    @order = order
    mail :to => order.email
    mail :subject => 'Pragmatic Store Order shipped'
  end
end
