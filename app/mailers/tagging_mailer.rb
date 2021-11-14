class TaggingMailer < ApplicationMailer
  def send_most_tagged_books(params)
    @params = params
    headers = {
      subject: "Most tagged books notifier",
      to: "alexi@coggno.com",
      from: "muhammadfakhar004@gmail.com",
    }
    mail(headers)
  end
end
