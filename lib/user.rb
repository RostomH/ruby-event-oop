require 'pry'
class User
  attr_accessor :email, :age
  @@user_count = 0
  @@all_users = []

  def initialize(email_to_save, age_to_save)
    @email = email_to_save
    @age = age_to_save
    @@user_count += 1
    @@all_users = @@all_users << self
  end

  def self.find_by_email(email)
    @@all_users.each do |user|
      if user.email == email
        puts "Voici l'âge de l'utilisateur trouvé avec l'adresse email fournie: #{user.age} ans"
      end
    end
    nil
  end

  def self.all
    return @@all_users
  end

  def self.count
    return @@user_count
  end

  binding.pry
  puts "end of file"  

end