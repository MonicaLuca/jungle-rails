require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do
    it "validates all fields are present" do
      @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: 'password'  
      @user.save

      expect(@user.errors.full_messages).to be_empty 
    end
    describe "password validations" do
      it "validates that the password and password confirmation are the same" do
        @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: 'password123'
        @user.save

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

      it "validates that the password field must be filled" do
        @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: nil, password_confirmation: 'password123'
        @user.save
        expect(@user.errors.full_messages).to include("Password can't be blank")
        end

      it "validates that the password confirmation field must be filled" do
        @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: nil
        @user.save
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "returns 'Password is too short (minimum is 8 characters)' error message when the email field is nil" do
        @user = User.new first_name: 'User', last_name: 'Test', email: nil, password: 'pa', password_confirmation: 'pa'
          @user.save

        expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      end
    end
    describe 'email validation'
      it "validates case-sensitive unique email" do
        @firstUser = User.new first_name: 'User', last_name: 'Test', email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password'  
        @firstUser.save

        @secondUser = User.new first_name: 'User', last_name: 'Test', email: 'test@test.COM', password: 'password', password_confirmation: 'password'  
        @secondUser.save

        expect(@secondUser.errors.full_messages).to include("Email has already been taken")
    end

    describe 'First Name validation'
      it "returns 'First name can't be blank' error message when the first name field is nil" do
        @user = User.new first_name: nil, last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: 'password'
          @user.save

        expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    describe 'Last Name validation'
      it "returns 'Last name can't be blank' error message when the last name field is nil" do
        @user = User.new first_name: 'User', last_name: nil, email: 'test@email.com', password: 'password', password_confirmation: 'password'
          @user.save

        expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    describe 'Email validation'
      it "returns 'Email can't be blank' error message when the email field is nil" do
        @user = User.new first_name: 'User', last_name: 'Test', email: nil, password: 'password', password_confirmation: 'password'
          @user.save

        expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it "returns nil if the email does not match with the given password" do
      @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: 'password' 

      @user.save

      expect(@user.authenticate_with_credentials('test11@email.com','password')).to be nil
    end

    it "returns nil if the password does not match with the give email" do
      @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: 'password' 

      @user.save

      expect(@user.authenticate_with_credentials('test@email.com','password11')).to be nil
    end

    it "returns User if the email and password match" do
      @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: 'password' 

      @user.save

      expect(@user.authenticate_with_credentials('test@email.com','password')).to eq @user
    end

    it "returns User if there is white space in email entry" do
      @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: 'password' 

      @user.save

      expect(@user.authenticate_with_credentials('   test@email.com    ','password')).to eq @user
    end

    it "returns User if the email has different casing then the saved email and password match" do
      @user = User.new first_name: 'User', last_name: 'Test', email: 'test@email.com', password: 'password', password_confirmation: 'password' 

      @user.save

      expect(@user.authenticate_with_credentials('TEST@email.com','password')).to eq @user
    end
  end
end
