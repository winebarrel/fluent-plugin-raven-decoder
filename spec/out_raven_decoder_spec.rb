describe Fluent::RavenDecoderOutput do
  let(:time) { Time.parse('2014-02-08 13:14:15 +0900').to_i }

  let(:raven_error) do
    {
      "auth_header" => "Sentry sentry_version=5, sentry_client=raven-ruby/0.13.3, sentry_timestamp=1432136088, sentry_key=SENTRY_PUBLIC_KEY, sentry_secret=SENTRY_SECRET_KEY",
      "data" => "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",
      "options" => {
        "content_type" => "application/octet-stream"
      },
      "project_id" => "2"
    }
  end

  let(:decoded_data) do
    {"event_id"=>"9864144b43dd38dfc84b230674170172",
     "message"=>"ZeroDivisionError: divided by 0",
     "timestamp"=>"2015-05-20T15:34:48",
     "time_spent"=>nil,
     "level"=>40,
     "project"=>nil,
     "logger"=>"root",
     "platform"=>"ruby",
     "culprit"=>"app/controllers/items_controller.rb in / at line 8",
     "server_name"=>"sugawaragenki-no-macbook-air.local",
     "extra"=>{},
     "tags"=>{},
     "user"=>{},
     "request"=>
      {"headers"=>
        {"Host"=>"localhost:3000",
         "Connection"=>"keep-alive",
         "Cache-Control"=>"max-age=0",
         "Accept"=>
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
         "User-Agent"=>
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36",
         "Accept-Encoding"=>"gzip, deflate, sdch",
         "Accept-Language"=>"ja,en-US;q=0.8,en;q=0.6",
         "Cookie"=>
          "_ga=GA1.1.727075564.1421045825; _app_session=b0tYeWJSay9aRnU1bjh4UzAyK3Q2ZEZoZVE0Snd3VVlLOSswaUtLVktQa1NDTFpmdUJXZVFIb1pFZng0ZlRUUDdlaDVnTjg2VnBjTUppYUE2anFiRGhteHAvNTNFRUZDbE1OT1FhdUtVSjJrOGlNbEN2UndCWllEdE84V2hEM0xhNGdFSXFBbDRTekpGaHVhelpWUG9BPT0tLTBGb01lWVk0UzhCWWozNEw0QS9wTmc9PQ%3D%3D--819b6cd4aa80d78ad1ddde9f0be07e52fc070c2c",
         "Version"=>"HTTP/1.1"},
       "env"=>
        {"REMOTE_ADDR"=>"::1",
         "SERVER_NAME"=>"localhost",
         "SERVER_PORT"=>"3000"},
       "cookies"=>nil,
       "url"=>"http://localhost:3000/items",
       "method"=>"GET",
       "query_string"=>"",
       "data"=>""}}
   end

  it do
    run_driver do |d|
      (1..3).each do |i|
        d.emit(raven_error, time + i)
      end

      expect(d.emits).to eq [
        ["decoded.raven.error", 1391832856, decoded_data],
        ["decoded.raven.error", 1391832857, decoded_data],
        ["decoded.raven.error", 1391832858, decoded_data],
      ]
    end
  end
end
