require 'spec_helper'

describe Microlist do
  
  let(:user) { FactoryGirl.create(:user) }

  before do 
  	@microlist = user.microlists.build(content: "Lorem ipsum") 
  end

  subject { @microlist }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }


describe "accessible attributes" do
	it "should not allow access to user_id " do
		expect do
			Microlist.new(user_id: user.id )
		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
	end
  end

describe "when user_id is not present" do
	before { @microlist.user_id = nil }
	it { should_not be_valid }
 end

 describe "when blank content" do
  before { @microlist.content = " " }
  it { should_not be_valid }
end

  describe "when content that is too long"
   before { @microlist.content = "v" * 201 }
   it { should_not be_valid }
 end
end



