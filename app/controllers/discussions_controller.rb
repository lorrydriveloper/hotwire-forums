# frozen_string_literal: true

class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion, only: %i[edit update]

  def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
  end

  def edit; end

  def create
    @discussion = Discussion.new(discussion_params)
    respond_to do |format|
      if @discussion.save
        format.html { redirect_to discussions_path, notice: 'Discussion successfully created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to discussions_path, notice: 'Discussion successfully updated' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit(:name, :close, :pinned)
  end

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end
end
