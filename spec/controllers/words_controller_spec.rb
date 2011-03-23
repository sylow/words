require 'spec_helper'

describe WordsController do
  def mock_word(stubs={})
    (@mock_word ||= mock_model(Word).as_null_object).tap do |word|
      word.stub(stubs) unless stubs.empty?
    end
  end
  describe "POST create" do
    it "creates a new word" do
      Word.should_receive(:new).with("text" => "aankomen"){mock_word}
      post :create, :word => {"text" => "aankomen"}
    end

    it "saves the word" do
      Word.should_receive(:new){mock_word}
      mock_word.should_receive(:save)
      post :create
    end
    context "when save is successful" do
      it "redirects to the Words index" do
        post :create
        response.should redirect_to(:action => "index")
      end
      it "stores flash[:notice] message" do
        post :create
        flash[:notice].should eq("The word was saved successfully")
      end
    end
    context "when word fails to save" do
      it "assigns @message" do
        mock_word(:save => false)
        post :create
        assigns[:message] = mock_word
      end
      it "renders the new template" do
        mock_word(:save => false)
        post :create
        response.should render_template("new")
      end
    end
  end
  describe "GET 'collect'" do
    it "should be successful" do
      get 'collect'
      response.should be_success
    end
    it "post collection of words" do
      post 'collect'
      response.should be_success
    end
  end

end
