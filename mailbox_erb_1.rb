require "erb"

class Email
  def initialize(subject, headers)
    @subject = subject
    @headers = headers
  end

  def subject
    @subject
  end

  def date
    @headers[:date]
  end

  def from
    @headers[:from]
  end
end

class Mailbox
  def initialize(name, emails)
    @name = name
    @emails = emails
  end

  def name
    @name
  end

  def emails
    @emails
  end
end

template = %(
  <html>
    <body>
      <h1>Messages for <%= name %></h1>
      <ul>
        <%= emails %>
        # <% emails.each do |message| %>
        #   <li><%= message %></li>
        # <% end %>
      </ul>
    </body>
  </html>
)

name = "Edwin"


emails = [
  Email.new("Homework this week", date: "2014-12-01", from: "Ferdous"),
  Email.new("Keep on coding! :)", date: "2014-12-01", from: "Dajana"),
  Email.new("Re: Homework this week", date: "2014-12-02", from: "Ariane")
]

mailbox = Mailbox.new("Ruby Study Group", emails)

html = ERB.new(template).result(binding)

puts html