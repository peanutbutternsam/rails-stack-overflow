class RemoveVoteCountColumnsFromQuestionsAndAnswers < ActiveRecord::Migration
  def change
    remove_column :questions, :vote_count
    remove_column :answers, :vote_count
  end
end
