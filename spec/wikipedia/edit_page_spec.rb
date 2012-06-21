describe 'Editing a Wikipedia Page' do
  context 'Logged on user' do
    it 'should be able to edit own user page' do
      Wikipedia::ensure_logged_in
      content, edit_message = Wikipedia::edit_user_page_by_adding_new_content
      visit Wikipedia::UserPage do |page|
        page.page_content.should include content
        page.view_history
        page.history_content.should include edit_message
        page.history_content.should include Wikipedia::USERNAME
      end
    end
  end
end