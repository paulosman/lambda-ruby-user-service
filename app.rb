require 'json'

def users
  {
    :username => 'paulosman',
    :email => 'paul@eval.ca'
  }
end

def handler(event:, context:)
  puts(JSON.generate(users))
  {
    event: JSON.generate(users),
    context: JSON.generate(context.inspect)
  }
end
