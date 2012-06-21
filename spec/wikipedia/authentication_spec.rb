describe 'Wikipedia Authentication' do
  context 'Login is optional' do
    it 'should show I am logged in when I am logged in' do
      Wikipedia.ensure_logged_in
      visit(Wikipedia::MainPage).logged_in_as.should == Wikipedia::USERNAME
    end

    it 'should not show I am logged in when I am not logged in' do
      Wikipedia.ensure_logged_out
      visit(Wikipedia::MainPage).should be_not_logged_in
    end
  end
end