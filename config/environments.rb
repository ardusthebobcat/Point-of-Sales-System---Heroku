configure :production, :development do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/app_development')
  ActiveRecord::Base.establish_connection('postgresql' : db.scheme,
    host: db.host,
    username: db.user, 
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8')
  end
