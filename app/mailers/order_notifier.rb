class OrderNotifier < ApplicationMailer
  default from: "niyaz-yakupov13@yandex.ru"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail(to: order.email, subject: 'Заказ товара на Pragmatic Store')
  end
end
