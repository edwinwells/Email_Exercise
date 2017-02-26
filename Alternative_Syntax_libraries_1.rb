require "json"

data = %({
  "emails": [
    {
      "subject": "Here's this week's homework!!",
      "date": "2015-01-04",
      "from": "Ariane"
    }
  ]
})
data = JSON.parse(data)

p data["emails"].first["subject"]