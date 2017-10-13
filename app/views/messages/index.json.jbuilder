if @new_messages.present?
  json.array! @new_messages do |message|
    json.id         message.id
    json.name       message.user.name
    json.created_at message.created_at.strftime('%Y-%m-%d %H:%M:%S UTC')
    json.text       message.body
    json.image      message.image
  end
end
