namespace :push_expire_date do
    desc "LINE PUSH通知で賞味期限切れそうになる前にお知らせする"
    task push_line_expire_date: :environment do
        greet = 'ハロー'
        message = {
            type: 'text',
            text: greet
        }
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
        User.all.each do |user|
            client.push_message(user.uid,message)
        end
        # p 'hello world'
    end
end
