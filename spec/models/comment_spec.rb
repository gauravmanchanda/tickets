require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { expect(Comment.reflect_on_association(:ticket).macro).to eq(:belongs_to) }
  it { expect(Comment.reflect_on_association(:author).macro).to  eq(:belongs_to) }

end
