require 'rails_helper'
require 'spec_helper'

RSpec.describe Post, 'create'  do
  
  context 'Validate post' do

    it 'a invalid post?' do
      post = Post.new
      post.user_id = User.first
      post.message = nil

      expect(post.valid?).to be_falsey
    end

    it 'post message bigger than 140?' do
      post = Post.new
  		post.user_id = User.first
      post.message = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur fringilla blandit enim ac iaculis. Consectetur adipiscing elit. Curabitur fringilla blandit enim ac iaculis'

      expect(post.valid?).to be_falsey
    end

  end

end

RSpec.describe Post, type: :model do
  it { should belong_to :user }
end

RSpec.describe Post, type: :model do
  it { should have_db_column(:message).of_type(:string).with_options(length: { maximum: 140 }, presence: true) }
end