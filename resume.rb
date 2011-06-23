require "sinatra/base"

class Resume < Sinatra::Base
  set :public, File.dirname(__FILE__) + '/public'
  get '/', :provides => 'html' do
    config = YAML.load_file(File.dirname(__FILE__) + "/config/stuff.yml")
    @late_job = config['late_job']
    @toys = config['toys']
    @involved = config['involved']
    @games = config['games']
    @past = config['past']
    @future = config['future']
    haml :index
  end
end