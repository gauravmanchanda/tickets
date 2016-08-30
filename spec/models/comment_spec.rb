require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { Comment.reflect_on_association(:ticket).macro.should  eq(:belongs_to) }
  it { Comment.reflect_on_association(:author).macro.should  eq(:belongs_to) }

end
