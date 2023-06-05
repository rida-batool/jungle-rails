require 'rails_helper'

RSpec.describe User, type: :model do
  #subject(:user) { User.new }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(firstname: 'John', lastname: 'Doe', email: 'test@example.com',password: 'password', password_confirmation: 'password' )

      expect(user).to be_valid
    end

    it 'return invalid if password and password confirmation fields do not match' do
      user = User.new(firstname: 'John', lastname: 'Doe', email: 'test@example.com',password: 'password', password_confirmation: 'new password' )
      
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'return invalid if firstname is nil' do
      user = User.new(firstname: nil, lastname: 'Doe', email: 'test@example.com',password: 'password', password_confirmation: 'password' )
      
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Firstname can't be blank")
    end

    
    it 'return invalid if lastname is nil' do
      user = User.new(firstname: 'John', lastname: nil, email: 'test@example.com',password: 'password', password_confirmation: 'password' )
      
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Lastname can't be blank")
    end

    it 'return invalid if email is nil' do
      user = User.new(firstname: 'John', lastname: 'Doe', email: nil,password: 'password', password_confirmation: 'password' )
      
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'return invalid if email duplicate in database (case-insensitive)' do
      User.create(firstname: 'John', lastname: 'Doe', email: 'test@example.com', password: 'password', password_confirmation: 'password' )
      user = User.new(firstname: 'Jane', lastname: 'Smith', email: 'TesT@example.com', password: 'password', password_confirmation: 'password' )
      
      expect(user.save).to be false
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it 'returns invalid if password length is less than 7' do
      user = User.create(firstname: 'John', lastname: 'Doe', email: 'test@example.com', password: 'pass', password_confirmation: 'pass' )

      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 7 characters)")
    end


  end
end
