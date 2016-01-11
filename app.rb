require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

songs = {
    '1' => 'http://gnarly.io/SpaceHarrier.mp3',
    '2' => 'http://gnarly.io/EmeraldHillZone.mp3',
    '3' => 'http://gnarly.io/OutRunSplashWave.mp3',
    '4' => 'http://gnarly.io/PowerDriftLikeTheWind.mp3',
    '5' => 'http://gnarly.io/PhantasyStar2.mp3',
}

get '/call' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Gather :numDigits => '1', :action => '/play', :method => 'get' do |g|
      g.Say 'For Space Harrier press 1'
      g.Say 'For Sonic 2 press 2'
      g.Say 'For Outrun press 3'
      g.Say 'For Power Drift press 4'
      g.Say 'For Phantasy Star 2 press 5'
      g.Say 'Press any other key to start over.'
    end
  end
  twiml.text
end

get '/play' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Play songs[params['Digits']]
  end
  twiml.text
end
