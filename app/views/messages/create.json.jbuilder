json.id         @newmessage.id
json.text       @newmessage.body
json.image      @newmessage.image
json.name       @newmessage.user.name
json.created_at @newmessage.created_at.strftime('%Y-%m-%d %H:%M:%S UTC')
