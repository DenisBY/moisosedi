# encoding: utf-8
desc "create random login and password"
task :random_logpas => :environment do
  @str = String.new
  user = User.all
  user.each do |user|
    user.update_attributes(:login => SecureRandom.hex(5), :password => SecureRandom.hex(5))
    @str += "#{user.id} #{user.owner}: login -- #{user.login}, password -- #{user.password}\n"
  end
    File.open('Логины и пароли.txt', 'w'){ |f| f.write @str }
end





















































































































