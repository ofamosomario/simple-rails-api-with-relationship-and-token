require 'rails_helper'
require 'spec_helper'

RSpec.describe User, 'create'  do
  
  context 'Validate user' do

  	it 'a valid user?' do
  		user = User.new
      user.email = 'tkyakow@gmail.com'
      user.name = 'Mario Augusto Carvalho Lara Leite'
      user.password = '123mudar'
      user.password_confirmation = '123mudar'

      expect(user.valid?).to be_truthy
    end

  end

end

RSpec.describe User, type: :model do
  it { should have_many :posts }
  it { should have_many :followed_users }
  it { should have_many :followers }
end

RSpec.describe User, type: :model do
  it { should have_db_column(:email).of_type(:string).with_options(presence: true) }
  it { should have_db_column(:name).of_type(:string).with_options(presence: true) }
  it { should have_db_column(:nickname).of_type(:string).with_options(presence: true) }
  it { should have_db_column(:encrypted_password).of_type(:string).with_options(presence: true) }
end