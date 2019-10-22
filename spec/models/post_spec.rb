require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'is a test with grafikart' do
    Post.create(description: 'loljhjhjhj')
    expect(Post.count).to eq(1) 
  end
end
 