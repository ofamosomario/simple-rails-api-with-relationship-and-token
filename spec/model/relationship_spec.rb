require 'rails_helper'
require 'spec_helper'

RSpec.describe Relationship, type: :model do
  it { should belong_to :follower }
  it { should belong_to :followed }
end

RSpec.describe Relationship, type: :model do
  it { should have_db_column(:follower_id).of_type(:integer).with_options(presence: true) }
  it { should have_db_column(:followed_id).of_type(:integer).with_options(presence: true) }
  it { should have_db_column(:status).of_type(:integer).with_options(presence: true) }
end