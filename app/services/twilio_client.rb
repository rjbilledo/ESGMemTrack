require 'twilio-ruby'

account_sid = 'ACf232221bc2610949ecc5171f0f611214'
auth_token = '22838d882d67514034ced08406778b4b'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+13023034365' # Your Twilio number
to = '+18326287131' # Your mobile phone number
to2 = '+18325852774'

client.messages.create(
from: from,
to: to,
body: "TEST"
)