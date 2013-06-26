enable :sessions

get '/' do
	@users = User.all
	member = User.find_by_email(params[:email])
	@name = member.first_name unless member.nil?

	session[:message]
  # Look in app/views/index.erb
  erb :index
end

#logging in

get '/login' do

  erb :login
end

post '/login' do

user = params[:post]
  if User.authenticate(params[:email], params[:password])
    session[:admin] = true
    session[:email] = params[:email]
    redirect '/'
  else
    "You entered the wrong username/password combo"
  end
end

#logging out

get '/log_out' do 
 session.clear
 redirect '/'
end

#Create an account

get '/sign_up' do

erb :sign_up
end

post '/sign_up' do
 @user = User.create(params)
redirect '/'
end

#Viewing the secret page
get '/secret' do
  if session[:admin]
  	erb :secret
  else
redirect '/'
end
end