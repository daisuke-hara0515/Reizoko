namespace :push_expire_date do
    desc "LINE PUSH通知で賞味期限切れそうになる前にお知らせする"
    task push_line_expire_date: :environment do
        expiration_date_stocks = Stock.where(expire_date: (Date.today - 1).all_day).pluck(:name)
        expiration_date_stocks.each do |push_message|
        message = {
            type: 'text',
            text: push_message
        }
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
        User.all.each do |user|
            client.push_message(user.uid,message)
        end
    end
    end
end
