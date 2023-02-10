require 'rails_helper'

RSpec.describe Item, :type => :model do
  subject { Item.new(name:"Book" ,price:"20",rating:3)}
  before { subject.save } 

  it "Name Should Be Present" do 
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "Price Should Be Present" do 
    subject.price = nil
    expect(subject).to_not be_valid
  end  

  it "Rating Should Be Present" do 
    subject.rating = nil
    expect(subject).to_not be_valid
  end  

#   it "Rating Must Be Under 5 " do
#     subject.rating  = 1..5
#     expect(subject.rating).to eq(3) 
#   end
  
end