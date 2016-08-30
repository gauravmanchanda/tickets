class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @success = @comment.save
  end

  private

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:body, :author_id, :ticket_id)
    end

end