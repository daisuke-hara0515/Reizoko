namespace :push_expire_date do
    desc "LINE PUSH通知で賞味期限切れそうになる前にお知らせする"
    task push_line_expire_date: :environment do
        p 'hello world'
    end
end
