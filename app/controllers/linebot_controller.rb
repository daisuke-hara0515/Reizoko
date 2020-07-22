class LinebotController < ApplicationController
  require 'line/bot' #gem 'line-bot-api'

  protect_from_forgery :except => [:callback] #CSRF(クロスサイトリクエストフォージェリー)対策

  def client
    @client ||= Line::Bot::Client.new{|config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read #http requestのボディをread?

    signature = request.env['HTTP_X_LINE_SIGNATURE'] #リクエストがLINEプラットフォームから来たものかどうかを検証する為の署名
    unless client.validate_signature(body,signature)
        head :bad_request
    end

    events = client.parse_events_from(body) #Array<Line::Bot::Event::Class>にparseする

    events.each {|event|
      case event
      when Line::Bot::Event::Message #eventオブジェクトがLine::Bot::Event::Messageと等価だったら。
        case event.type
        when Line::Bot::Event::MessageType::Text #event.typeがLine::Bot::Event::MessageType::Textと等価だったら。
          message = {
            type: 'text',
            text: event.message['text'] #テキストでメッセージをハッシュでmessageに突っ込む？
          }
        end
    end
    }
    head :ok
  end
end




end
