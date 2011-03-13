require 'spec_helper'

describe WordsController do

  describe "GET 'collect'" do
    it "should be successful" do
      get 'collect'
      response.should be_success
    end
  end

end
