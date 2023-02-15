# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
